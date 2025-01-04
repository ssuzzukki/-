def _tax(shotoku)
    if shotoku >= 40000000
        return shotoku * 0.45 - 4796000
    elsif shotoku >= 18000000
        return shotoku * 0.40 - 2796000
    elsif shotoku >= 9000000
        return shotoku * 0.33 - 1536000
    elsif shotoku >= 6950000
        return shotoku * 0.23 - 636000
    elsif shotoku >= 3300000
        return shotoku * 0.2 - 427500
    elsif shotoku >= 1950000
        return shotoku * 0.1 - 97500
    elsif shotoku >= 1000
        return shotoku * 0.05
    else
        return 0
    end
end

def _kirisute(tax)
    tax = tax - (tax % 1)
    return tax
end

def _konma(n)
    ans = ""
    n = n.to_s
    turn = 1
    while n.size != 0
        if turn % 3 == 0
            ans = "," + n[-1] + ans
        else
            ans = n[-1] + ans
        end
        n[-1] = ""
        turn += 1
    end
    if ans[0] == ","
        ans[0] = ""
    end
    return ans
end


loop do
    puts "所得を入力"
    syotoku = gets.chomp.gsub(/[^0-9]/, "").to_f
    shotoku = syotoku - (syotoku % 1000)

    syotokuzei = _konma(_kirisute(_tax(shotoku)).to_i)
    tedori = _konma(syotoku.to_i - _kirisute(_tax(shotoku)).to_i)
    (tedori.size - syotokuzei.size).times do
        syotokuzei = " " + syotokuzei
    end
    puts "手取り:" + tedori + "円"
    puts "所得税:" + syotokuzei + "円"
    puts "--------------------------------------------------------------------------------------"
end