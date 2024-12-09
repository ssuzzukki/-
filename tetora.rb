#テトラナッチ数列の計算

def tetora(n)
    if n == 0 || n == 1 || n == 2
        return 0
    elsif n == 3 || n == 4
        return 1
    elsif n == 5
        return 2
    elsif n == 6
        return 4
    elsif n == 7
        return 8
    elsif n == 8
        return 15
    elsif n == 9
        return 29
    elsif n == 10
        return 56
    elsif n == 11
        return 108
    elsif n == 12
        return 208
    elsif n == 13
        return 401
    elsif n == 14
        return 773
    elsif n == 15
        return 1490
    elsif n == 16
        return 2872
    elsif n == 17
        return 5536
    elsif n == 18
        return 10671
    elsif n == 19
        return 20569
    elsif n == 20
        return 39648
    elsif n == 30
        return 28074040
    elsif n == 31
        return 54114452
    elsif n == 32
        return 104308960
    elsif n == 33
        return 201061985
    else
        ans = tetora(n-1) + tetora(n-2) + tetora(n-3) + tetora(n-4)
        return ans
    end
end

puts "tetora?"
n = gets.to_i

p tetora(n)