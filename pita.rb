#ピタゴラス素数の判定


def _pita(n)
    ans = []
    if n % 4 == 1
        for i in 1 ..n do
            n2 = n - i*i
            if n2 < 0
                break
                #return []
            end
            for j in 1 ..n2 do
                if n2 == j*j
                    ans = [i, j]
                    #return ans
                end
            end
        end
        if ans.size == 2
            puts "#{n}はピタゴラス素数です"
            puts "2つの平方数の根は#{ans[0]},#{ans[1]}です"
        else
            puts "#{n}はピタゴラス素数ではありません"
        end
    else
        puts "#{n}はピタゴラス素数ではありません"
    end
end

puts "number?"
n = gets.to_i
_pita(n)
