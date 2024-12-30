# ruby make_bf <-w or -f> <文字列orファイル名> <新しいファイル名.bf>

def _pluses(n)
    plus = ""
    for i in 1..n
        plus = plus + "+"
    end
    return plus
end

def _kakezan(n)
    if n <= 10
        return _pluses(n)
    elsif n % 13 == 0
        return ">" + _pluses(13) + "[<" + _pluses(n/13) + ">-]<"
    elsif n % 11 == 0
        return ">" + _pluses(11) + "[<" + _pluses(n/11) + ">-]<"
    elsif n % 10 == 0
        return ">" + _pluses(10) + "[<" + _pluses(n/10) + ">-]<"
    elsif n % 9 == 0
        return ">" + _pluses(9) + "[<" + _pluses(n/9) + ">-]<"
    elsif n % 7 == 0
        return ">" + _pluses(7) + "[<" + _pluses(n/7) + ">-]<"
    elsif n % 6 == 0
        return ">" + _pluses(6) + "[<" + _pluses(n/6) + ">-]<"
    elsif n % 5 == 0
        return ">" + _pluses(5) + "[<" + _pluses(n/5) + ">-]<"
    elsif n % 4 == 0
        return ">" + _pluses(4) + "[<" + _pluses(n/4) + ">-]<"
    #elsif n % 3 == 0
        #return ">" + _pluses(3) + "[<" + _pluses(n/3) + ">-]<"
    #elsif n % 2 == 0
        #return ">" + _pluses(2) + "[<" + _pluses(n/2) + ">-]<"
    else
        return "+" + _kakezan(n-1)
    end
end


if !(ARGV[2] =~ /.bf$/)
    puts "Please enter appropriate arguments."
    exit
end
if ARGV[0] == "-w"
    sent = ARGV[1]
elsif ARGV[0] == "-f"
    filename = ARGV[1]
    file = File.open(ARGV[1])
    sent = file.read
else
    puts "Please enter appropriate arguments."
    exit
end
#p sent
aftercode = ""
ascii_codes = sent.unpack("U*")
#p ascii_codes
befornum = 0
ascii_codes.each do |num|
    if befornum == num
        if aftercode[-1] ==">"
            aftercode[-1] = ""
        end
        aftercode = aftercode + "."
    else
        if aftercode[-1] != ">"
            aftercode = aftercode + ">"
        end
        aftercode = aftercode + _kakezan(num) + "."
    end
    befornum = num
end

if aftercode[0] == ">"
    aftercode[0] = ""
end
if aftercode[-1] ==">"
    aftercode[-1] = ""
end

puts "code size:#{aftercode.size}"
newfile = File.new(ARGV[2], "w")
newfile.write(aftercode)