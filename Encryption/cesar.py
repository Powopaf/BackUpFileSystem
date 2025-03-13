def encrypt(file, key="../key"):
    k = open(key, 'r')
    doc = open(file, 'r')
    new = open(file + ".cesar", 'w')

if __name__ == '__main__':
    encrypt("../key")
