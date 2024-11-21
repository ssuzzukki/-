#指定したディレクトリ内の指定した拡張子のファイルに決まった操作をする(非破壊的)
beforName = "Maps_new"    #操作するディレクトリ
dirName = "AfterFiles"  #変換後のファイルを格納するディレクトリ
Dir.mkdir(dirName)
Dir::foreach(beforName){|f|
    
    if  f =~ /map$/ #拡張子
        file = File.open("./"+beforName+"/"+f , "r")
        #ここから処理
        scr = file.read
        file = File.open("./"+dirName+"/"+f , "w")
        array = scr.split("\n", 3)
        array[1] = "T:130"
        array.each do |l|
            file.puts(l)
        end
    end
}


