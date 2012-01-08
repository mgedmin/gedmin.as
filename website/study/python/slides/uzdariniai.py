
def cezario_sifras(postumis):
    def sifruok(simboliu_eilute):
        zodynas = {}
        for kodas in range(256):
            zodynas[kodas] = kodas
        for kodas in range(ord('a'), ord('z')+1):
            naujas = (kodas - ord('a') + postumis) % 26
            zodynas[kodas] = naujas + ord('a')
        simboliu_kodai = map(ord, simboliu_eilute)
        for i in range(len(simboliu_kodai)):
            simboliu_kodai[i] = zodynas[simboliu_kodai[i]]
        simboliai = map(chr, simboliu_kodai)
        return ''.join(simboliai)
    return sifruok

sifruok2 = cezario_sifras(2)
sifruok13 = cezario_sifras(13)
print sifruok2('labas rytas')
print sifruok13('labas rytas')
