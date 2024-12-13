def _soinsubunkai2(orig_number)
    result = []
    final_answer = []

    for i in 2..orig_number do

        while orig_number % i == 0 do
            result.push(i)
            orig_number /= i
        end

        if orig_number == 1
            break
        elsif i > orig_number / 3 + 2
            result.push(orig_number.to_i)
            break
        end
    end

    result.each do |res|
        if result.count(res) != 1
            final_answer.push(res.to_s + "^" + result.count(res).to_s)
        elsif result.count(res) == 1
            final_answer.push(res.to_s)
        end
    end
    final_answer.uniq!
    puts "素因数分解の結果は"
    #p result
    p final_answer
    puts "です。"
    if result.inject(:*) == 57
        puts "57はグロタンディーク素数です。"
    end
end

def _root(orig_number)
    orig_number2 = orig_number.to_f
    root_answer = 1.to_f

    200.times do
        root_answer = (orig_number2 / root_answer / 2) + (root_answer / 2)
    end
    if root_answer.to_s.to_i == 0
        puts "平方根はうまく求められませんでした。"
    elsif root_answer > 0
        if root_answer % 1 == 0
            root_answer = root_answer.to_i
        end
        puts "平方根は" + root_answer.to_s + "です。"
    end
end

def _kisuuhenkan(henkan_num, kisuu)
    befor_henkan = henkan_num
    after_henkan = 0
    sisuu = 0
    loop do
        if henkan_num % kisuu == 0
            henkan_num /= kisuu
        elsif henkan_num % kisuu != 0
            after_henkan += (henkan_num % kisuu) * (10**sisuu)
            if henkan_num < kisuu 
                break
            end
            henkan_num = (henkan_num - (henkan_num % kisuu)) / kisuu
        end
        sisuu += 1
    end
    puts "10進数の" + befor_henkan.to_s + "は" + kisuu.to_s + "進数で" + after_henkan.to_s + "です。"
end


loop do
    puts "--------------------------------------------------------------------------"
    puts "入力した数の素因数分解、平方根、n進表現を求めます"
    puts "平方根は値が大きすぎるとうまく表示されない可能性があります。"
    puts "2以上の自然数を入力してください"
    orig_number = gets.chomp
    if orig_number == "exit"
        puts "bye!"
        break
    elsif orig_number =~ /\d+/
        orig_number = orig_number.to_i
    else
        puts "2以上の自然数を入力してください"
        next
    end
    if orig_number < 2 or orig_number % 1 != 0
        puts "2以上の自然数を入力してください"
        next
    end
    puts "何進数に変換するか、2~10から選んでください"
    kisuu = gets.to_i
    if kisuu < 2 || kisuu > 10
        puts "2~10で決めてください"
        next
    end
    puts orig_number.to_s + "についての計算結果です。"
    _soinsubunkai2(orig_number)
    _root(orig_number)
    _kisuuhenkan(orig_number, kisuu)
end