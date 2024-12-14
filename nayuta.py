import time


def _option_num(n):
    if n % 4 == 0:
        num = ""
    elif n % 4 == 1:
        num = "十"
    elif n % 4 == 2:
        num = "百"
    elif n % 4 == 3:
        num = "千"
    return num

def full_name(n):
    if n >= 72:
        name = "<とってもおっきい数>"
    elif n >= 68:
        name = _option_num(n) + "無量大数"
    elif n >= 64:
        name = _option_num(n) + "不可思議"
    elif n >= 60:
        name = _option_num(n) + "那由多"
    elif n >= 56:
        name = _option_num(n) + "阿僧祇"
    elif n >= 52:
        name = _option_num(n) + "恒河沙"
    elif n >= 48:
        name = _option_num(n) + "極"
    elif n >= 44:
        name = _option_num(n) + "載"
    elif n >= 40:
        name = _option_num(n) + "正"
    elif n >= 36:
        name = _option_num(n) + "澗"
    elif n >= 32:
        name = _option_num(n) + "溝"
    elif n >= 28:
        name = _option_num(n) + "穣"
    elif n >= 24:
        name = _option_num(n) + "杼"
    elif n >= 20:
        name = _option_num(n) + "垓"
    elif n >= 16:
        name = _option_num(n) + "京"
    elif n >= 12:
        name = _option_num(n) + "兆"
    elif n >= 8:
        name = _option_num(n) + "億"
    elif n >= 4:
        name = _option_num(n) + "万"
    elif n >= 1:
        name = _option_num(n)
    elif n == 0:
        name = "一"

    return name

print("ぼくは<10のn乗>誰何\n「誰何」と書いて「すいか」って読むんだよ\nn=?")

n = input()
if "".join(filter(str.isdigit, n)) == "" or n.split("-")[0] == "":
    print("かわいそう……\n君も大事に使うからね\nごめんね")
else:
    #print(int("".join(filter(str.isdigit, n))))
    print("ぼくは"+full_name(int("".join(filter(str.isdigit, n))))+"誰何")
    print("「誰何」と書いて「すいか」って読むんだよ")
    if int("".join(filter(str.isdigit, n))) == 56562:
        print("\nコロコロチュウ")
        time.sleep(1)

        for i in range(30):
            print(".")
            time.sleep(0.5)

        print("さっきからずっと覗いてるツノのまぞく\nお前はまた来ていつか殺す")
    elif int("".join(filter(str.isdigit, n))) == 60:
        print("\n\n\n\nぼくの願いはこの世全ての「かわいそう」を根絶すること！\n")
        print("　　　　　　　　　エサ")
        print("そのために見かけた魔族は全部食べています")



input()