#鬼ごっこゲーム
require "gosu"

class GameWindow < Gosu::Window

    attr_accessor :win_x, :win_y
    def initialize(win_x, win_y)
        @win_x = win_x
        @win_y = win_y
        super @win_x, @win_y
        self.caption = "鬼ごっこ"
        @font = Gosu::Font.new(30)
        @player = Player.new(@win_x/4,@win_y/4)
        $ob_x = 3*@win_x/4
        $ob_y = 3*@win_y/2
        @turn = 0
        @target = 1
        @time = 30
        @start = false
        @ending = false
    end
    
    def update
        if @time > 0 && @start == true
            @turn += 1
            if @turn % 60 == 0
                @time -= 1
            end
            
    
            #[lambda{$ob_x += [-40, 0, 40].sample}, lambda{$ob_y += [-40, 0, 40].sample}].sample.call
    
            
            if @turn % 1 == 0
                target_val = [1, 2, -1, -2]
                target_val.delete(@target*(-1))
            end
            @target = target_val.sample
    
    
            if @target == 1
                $ob_y -= 40
            elsif @target == -1
                $ob_y += 40
            elsif @target == 2
                $ob_x += 40
            elsif @target == -2
                $ob_x -= 40
            end
    
    
    
    
            if $ob_x >= @win_x-40
                $ob_x = @win_x-40
            elsif $ob_x <= 0
                $ob_x = 0
            end
    
            if $ob_y >= @win_y-40
                $ob_y = @win_y-40
            elsif $ob_y <= 0
                $ob_y = 0
            end
    
            if @player.x >= @win_x-40
                @player.x = @win_x-40
            elsif @player.x <= 0
                @player.x = 0
            end
    
            if @player.y >= @win_y-40
                @player.y = @win_y-40
            elsif @player.y <= 0
                @player.y = 0
            end
    
    
            @player.move
            @player.hit
        elsif @start == true
            @ending = true
        end
    
    end

    def draw
        draw_quad(@player.x, @player.y, Gosu::Color::RED,
                  @player.x, @player.y+40, Gosu::Color::RED,
                  @player.x + 40, @player.y, Gosu::Color::RED,
                  @player.x + 40, @player.y+40, Gosu::Color::RED)
        draw_quad($ob_x, $ob_y, Gosu::Color::BLUE,
                  $ob_x, $ob_y+40, Gosu::Color::BLUE,
                  $ob_x+40, $ob_y, Gosu::Color::BLUE,
                  $ob_x+40, $ob_y+40, Gosu::Color::BLUE)

        @font.draw("score: #{@player.score}", 10, 10, 0)
        @font.draw("time: #{@time}", 10, 40, 0)
        #@font.draw("turn: #{@turn}", 10, 70, 0)
        if @ending == true
            @font.draw("Your Score: #{@player.score}", 10, 70, 0)
        end
        if @start == false
            @font.draw("PRESS SPACE TO START", 10, 70, 0)
        end
    end

    def button_down(id)
        #close if id == Gosu::KB_Q
        if id == Gosu::KB_Q
            close
        elsif id == Gosu::KB_SPACE && @start == false
            @start = true
            @turn = 0
        end
    end
end


class Player
    attr_accessor :x, :y, :score
    def initialize(x,y)
        @x = x
        @y = y
        @v = 20
        @score = 0
    end
  
    
    def move
        if Gosu::button_down?(Gosu::KB_W)
            @y -= @v
        elsif Gosu::button_down?(Gosu::KB_D)
            @x += @v
        elsif Gosu::button_down?(Gosu::KB_S)
            @y += @v
        elsif Gosu::button_down?(Gosu::KB_A)
            @x -= @v
        end
    end

    def hit
        if  @x >= $ob_x-40 && @x <= $ob_x+40 && @y >= $ob_y-40 && @y <= $ob_y+40
            @score += 1
            #puts @score
        end
    end
  
    #def draw
    #end
end

#puts "window_hight=?"
#x = gets.to_i
#puts "window_width=?"
#y = gets.to_i
window = GameWindow.new(900, 900)
window.show