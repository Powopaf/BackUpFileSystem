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

def decrypt(file: str, key: int, name: str) -> None:
    doc = open(file, 'r')
    new = open(name, 'w')
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
    encrypt("../key", key_int())
    decrypt("../key.cesar", key_int(), "../key.decrypt")

