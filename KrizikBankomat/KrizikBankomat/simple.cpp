// Zjednodusena verze programu s vysvetenim, pro jednoduchost nejsou pouzivany nektere spravne praktiky

#include <iostream> // Knihovna pro vstup a vystup
#include <cstdlib> // Knihocna pro funkci 'atoi' pro prevod textu na cislo

using namespace std;

int main() {
    // Definuju bankovky
    int dveste = 200;
    int tisic = 1000;
    int dvatisice = 2000;
    int pettisic = 5000;

    // Nadefinuju pocty bankovek
    int pocet200 = 0;
    int pocet1000 = 0;
    int pocet2000 = 0;
    int pocet5000 = 0;

    // Dokud je true, while se bude do nekonecna opakovat
    bool zadavaniKartyPinu = true;
    while (zadavaniKartyPinu) {
        // Zadame cislo karty a pin
        cout << "Zadejte cislo karty" << endl;
        string cislokarty;
        cin >> cislokarty;

        cout << "Zadejte pin" << endl;
        string pin;
        cin >> pin;

        // Ma cislo karty a pin spravnou delku? Obsahuje cislo karty a pin pouze znaky 1234567890?
        if (cislokarty.length() == 6 && pin.length() == 4 && pin.find_first_not_of("1234567890") == string::npos &&
            cislokarty.find_first_not_of("1234567890") == string::npos) {
            // Ano, muzeme pokracovat, nastavime boolean na false
            zadavaniKartyPinu = false;
        } else {
            // Ne, vypiseme hlasku a jedeme znova
            cout << "Spatne zadany pin a nebo cislo karty, zkuste to znovu" << endl;
        }
    }

    bool zadavaniCastky = true;
    while (zadavaniCastky) {
        // Zadame castku
        cout << "Zadejte castku k vyberu, musi byt max 24000 a delitelna 200" << endl;
        string castka;
        cin >> castka;

        // Zkontrolujeme, jestli je castka pouze ciselna
        if (castka.find_first_not_of("1234567890") == string::npos) {
            // Ano, castka je cislo, prevedeme na cislo
            int cislocastka = atoi(castka.c_str());

            // Zkontrolujeme, jestli je castka mensi nebo rovno 24000, vetsi nebo rovno 0 a zaroven, jestli je zbytek po deleni nejmensim spolecnym nasobkem bankovek (200) roven 0
            if (cislocastka <= 24000 && cislocastka >= 0 && cislocastka % 200 == 0) {
                // Ano, uz nebudeme opakovat zadavani castky
                zadavaniCastky = false;

                // Rozdelime castku na bankovky od nejvetsi k nejmensi
                // Dokud je castka mensi nebo rovno, budeme od ni odcitat danou hodnotu a pricitat pocet dane bankovky ==> rozdelovani na jednotlive bankovky
                while (cislocastka >= pettisic) {
                    // Pri
                    pocet5000 = pocet5000 + 1;
                    cislocastka = cislocastka - pettisic;
                }

                while (cislocastka >= dvatisice) {
                    pocet2000 = pocet2000 + 1;
                    cislocastka = cislocastka - dvatisice;
                }

                while (cislocastka >= tisic) {
                    pocet1000 = pocet1000 + 1;
                    cislocastka = cislocastka - tisic;
                }

                while (cislocastka >= dveste) {
                    pocet200 = pocet2000 + 1;
                    cislocastka = cislocastka - dveste;
                }

                // Hotovo, muzeme nyni vypsat vysledek
                cout << "Vybrana castka " << zadavaniCastky << endl;
                cout << "200 x " << pocet200 << endl;
                cout << "1000 x " << pocet1000 << endl;
                cout << "2000 x " << pocet2000 << endl;
                cout << "5000 x " << pocet5000 << endl;

                // Ukoncime cyklus zadavani castky a tim skoncime program
                zadavaniCastky = false;
            } else {
                // Neni, zadavame znovu
                cout << "Spatna castku, zkuste to prosim znovu" << endl;
            }
        }
    }

    // Je vhodne vracet pri ukonceni programu hodnotu 0, pokud skoncil bez chyby, ale neni to nutnost
    return 0;
}