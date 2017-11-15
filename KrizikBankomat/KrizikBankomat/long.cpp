/* Bankomat
 * Tato verze je dle standartu C++98
 * Testovano na Linux Mint 18.2, Intel Kaby Laka
 * Kompilovano za pomoci CLang 3.8
 *
 * Zadani:
 * pouzivat while cyklus
 * zadat cislo karty o maximalni delce 6 znaku, muze byt slozeno i z nul
 * zadat ciselny pin op maximalni delce 4 znaky, muze byt slozen i z nul
 * povolene bankovky: 200, 1000, 2000, 5000
 * zadat castku k vyberu slozenou pouze z povolenych bankovek, maximalne 24000
 * vypsat castku k vyberu a slozeni bankovek vybirane castky
 */

#include <iostream>
#include <vector>

using namespace std;

// V tomto bloku se nalezaji pomocne metody
//----------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------

/**
 * Pocet povolenych znaku pro pole 'znaky' pro metodu 'doesNotContainsOtherThan'
 */
const int pocetPovoenychZnaku = 10;

/**
 * Pole povolenych znaku pro metodu 'doesNotContainsOtherThan'
 */
const char znaky [10] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};

/**
 * Zjistuje, jestli 'input' obsahuje jine znaky nez obsahuje char[] 'allowedChars'
 *
 * @param input - string, Odkaz na string, ktery budeme kontrolovat
 * @param allowedChars - char[], Pole povolenych znaku
 * @return boolean - true kdyz string obsahuje alespon 1 znak jiny nez z 'allowedChars'
 */
bool doesNotContainsOtherThan(const string &input, const char allowedChars[]) {
    const char *in = input.c_str();
    bool result = true;

    for (int x = 0; x < input.length(); x++) {
        bool singlechar = false;
        for (int y = 0; y < pocetPovoenychZnaku; y++) {
            singlechar = singlechar || (int) in[x] == (int) allowedChars[y];
        }
        result = result && singlechar;
    }
    return result;
}

/**
 * Struktura pro metodu CharArrToInt
 *
 * bool ok = true kdyz parsovany string je kladne cislo
 * result = vysledne cislo
 */
struct CharArrToIntResult {
    bool ok;
    long long int result;
};

/**
 * Vlastni implementace metody 'atoi', pouziva pouze kladna cisla, pri nalezeni znaku jineho nez cislo skonci
 *
 * @param in - const char *ptr, pointer na string prevedeny na char[]
 * @return struct(bool ok, long long int result), ok = true kdyz parsovany string je kladne cislo, result = vysledek
 */
CharArrToIntResult charArrToInt(const char *in) {
    CharArrToIntResult cres = CharArrToIntResult();
    cres.ok = true;
    cres.result = 0;

    while (true) {
        if ((*in >= '0') && (*in <= '9')) {
            cres.result *= 10;
            cres.result += (*in - (int) '0');
            in++;
        } else {
            cres.ok = *in == '\0';
            break;
        }
    }
    return cres;
}

//----------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------

/**
 * pocetTypuBankovek = pocet typu bankovek
 */
const int pocetTypuBankovek = 4;

/**
 * bankovky = hodnoty kazdeho typu bankovek
 */
const int bankovky[pocetTypuBankovek] = {5000, 2000, 1000, 200};

/**
 * pocetBankovek = pocet kazdeho typu bankovky k vyberu
 */
int pocetBankovek[pocetTypuBankovek] = {0, 0, 0, 0};

/**
 * iCastka = budouci castka vyberu prevedena ze string na int
 */
long long int iCastka;

/**
 * Funkce main
 *
 * @return 0
 */
int main() {
    /**
     * karta = cislo karty, pin = pin ke karte, sCastka = zadana castka k vyberu
     */
    string karta, pin, sCastka;

    while (true) {
        cout << "Zadejte cislo karty a pote pin" << endl;
        cin >> karta;
        cin >> pin;

        if (karta.length() == 6 && pin.length() == 4 && doesNotContainsOtherThan(karta, znaky) &&
            doesNotContainsOtherThan(pin, znaky)) {
            bool castkaNeniOk = true;
            while (castkaNeniOk) {
                cout << "Zadejte castku k vyberu (max 24000, musi byt delitelna 200)" << endl;
                cin >> sCastka;
                CharArrToIntResult c = charArrToInt(sCastka.c_str());
                iCastka = c.result;
                if (c.ok && iCastka >= 200 && iCastka <= 24000 && iCastka % 200 == 0) {
                    castkaNeniOk = false;

                    cout << "Uspesne vybrano " << sCastka << " ve formatu: " << endl;

                    for (int x = 0; x < 4; x++) {
                        while (iCastka >= bankovky[x]) {
                            iCastka -= bankovky[x];
                            pocetBankovek[x]++;
                        }

                        cout << bankovky[x] << " x " << pocetBankovek[x] << endl;
                    }

                } else {
                    cout << "Chybna castka" << endl;
                }
            }

        } else {
            cout << "Chybne cislo karty a nebo pin" << endl;
        }

        const string pomlcky = "-------------------------------";
        cout << pomlcky << endl;
        cout << "Prejete si pokracovat? (Y/n)" << endl;
        string yesno;
        cin >> yesno;
        if (yesno == "n" | yesno == "N") {
            break;
        }
        cout << pomlcky << endl << endl;
    }

    return 0;
}