#ruby bf.rb <code.bf>

$pointer = 0
$memory =[0]
$commandpointer = 0

def _brainfuck(command, code)
    if command == ">"
        $pointer += 1
        if $pointer == $memory.size
            $memory.push(0)
        end
    elsif command == "<" && $pointer != 0
        $pointer -= 1
    elsif command == "."
        print format("%c", $memory[$pointer])   #ASCIIコード変換
    elsif command == "+"
        $memory[$pointer] = $memory[$pointer] + 1
    elsif command == "-"
        $memory[$pointer] = $memory[$pointer] - 1
    elsif command == ","
        $memory[$pointer] = gets.to_i
    elsif command == "["
        if $memory[$pointer] == 0
            counter = 0
            loop do
                $commandpointer += 1
                if code.slice($commandpointer) == "]" && counter == 0
                    break
                end
                if code.slice($commandpointer) == "["
                    counter += 1
                elsif code.slice($commandpointer) == "]"
                    counter -= 1
                end
            end
        else
            #p "next"
        end
    elsif command == "]"
        if $memory[$pointer] != 0
            counter = 0
            loop do
                $commandpointer -= 1
                if code.slice($commandpointer) == "[" && counter == 0
                    break
                end
                if code.slice($commandpointer) == "["
                    counter -= 1
                elsif code.slice($commandpointer) == "]"
                    counter += 1
                end
            end
        else
            #p "next"
        end
    end
    $commandpointer += 1
end

file = File.open(ARGV[0])#("test.bf", "r")
code = file.read

loop do
    if $commandpointer > code.size
        break
    end
    _brainfuck(code.slice($commandpointer), code)
end

