#p 999917%4
##p 999931%4
#p 999953%4
##p 999959%4
#p 999961%4
#ピタゴラス素数の判定


def _pita(n)
    for i in 1 ..n do
        n2 = n - i*i
        if n2 < 0
            return []
        end
        for j in 1 ..n2 do
            if n2 == j*j
                ans = [i, j]
                return ans
            end
        end
    end
end

puts "number?"
n = gets.to_i

a = _pita(n)
p a
p a[0]**2 + a[1]**2