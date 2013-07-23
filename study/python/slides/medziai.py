import os

def apeik_medi(saknis, ka_daryti):
    ka_daryti(saknis)
    for name in os.listdir(saknis):
        full_name = os.path.join(saknis, name)
        if (os.path.isdir(full_name) and full_name != '..'
            and full_name != '.'):
            apeik_medi(full_name, ka_daryti)


def kiek_failu(saknis):
    start = len(saknis)
    def spausdink_failu_skaiciu(kur):
        print "%s yra %d failu" % (kur[start:], len(os.listdir(kur)))
    apeik_medi(saknis, spausdink_failu_skaiciu)

if __name__ == '__main__':
    kiek_failu('notes/teaching-python')
    kiek_failu('notes/europython2006')

