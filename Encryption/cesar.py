import sys
import string

def change_name(name: str) -> str:
    return name.rsplit(".", 1)[0]

def key_int(key="../key") -> int:
    k = open(key, 'r')
    key = k.readline()
    res: int = 0
    for char in key:
        res *= 10
        match char:
            case '0':
                res += 0
            case '1':
                res += 1
            case '2':
                res += 2
            case '3':
                res += 3
            case '4':
                res += 4
            case '5':
                res += 5
            case '6':
                res += 6
            case '7':
                res += 7
            case '8':
                res += 8
            case '9':
                res += 9
    k.close()
    res //=10
    return res

def encrypt(file: str, key: int) -> None:
    doc = open(file, 'r')
    new = open(file + ".cesar", 'w')
    line: str = doc.readline()
    while line:
        for char in line:
            if char == "\n":
                new.write("\n")
                continue
            c: int = ord(char) + key % 256
            new.write(chr(c))
        line = doc.readline()
    doc.close()
    new.close()

def decrypt(file: str, key: int) -> None:
    doc = open(file, 'r')
    new = open(change_name(file), 'w')
    line: str = doc.readline()
    while line:
        for char in line:
            if char == "\n":
                new.write("\n")
                continue
            c: int = ord(char) - key % 256
            new.write(chr(c))
        line = doc.readline()
    doc.close()
    new.close()

if __name__ == '__main__':
    arg1 = sys.argv[1]
    arg2 = sys.argv[2]
    arg3 = sys.argv[3]

    if arg1 == "encrypt":
        encrypt(arg2, key_int(arg3))
        sys.exit(0)
    
    elif arg1 == "decrypt":
        decrypt(arg2, key_int(arg3))
        sys.exit(0)

    else:
        print("Invalid command")
        sys.exit(1)



