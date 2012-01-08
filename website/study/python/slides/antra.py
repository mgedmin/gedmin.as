def vidurkis(pazymiai):
    return float(sum(pazymiai)) / len(pazymiai)

def main():
    pazymiai = {}
    for eilute in file('duom.txt'):
        vardas, pazymys = eilute.split()
        if vardas not in pazymiai:
            pazymiai[vardas] = []
        pazymiai[vardas].append(int(pazymys))
    for vardas in sorted(pazymiai):
        print vardas, vidurkis(pazymiai[vardas])

if __name__ == '__main__':
    main()
