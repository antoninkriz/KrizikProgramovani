#include <iostream>
int main() {
    int iCastka, bankovky[4] = {5000, 2000, 1000, 200}, pocet[4] = {0, 0, 0, 0};
    std::string karta, pin, sCastka, cisla = "0123456789", pomlcky = "--------------------------------";
    std::cout << "Zadejte cislo karty a pote pin" << std::endl;
    std::cin >> karta;
    std::cin >> pin;
    if (karta.length() == 6 && pin.length() == 4 && karta.find_first_not_of(cisla) == std::string::npos && pin.find_first_not_of(cisla) == std::string::npos) {
        znovu:
        std::cout << "Zadejte castku k vyberu (max 24000, musi byt delitelna 200)" << std::endl;
        std::cin >> sCastka;
        if (sCastka.find_first_not_of(cisla) == std::string::npos && atoi(sCastka.c_str()) > 0 && atoi(sCastka.c_str()) % 200 == 0 && atoi(sCastka.c_str()) <= 24000) {
            iCastka = atoi(sCastka.c_str());
            for (int x = 0; x < 4; x++) {
                while (iCastka >= bankovky[x]) {
                    iCastka -= bankovky[x];
                    pocet[x]++;
                }
            }
            std::cout << "Uspesne vybrano " << sCastka << " ve formatu: " << pocet[0] << "x" << bankovky[0] << ", " << pocet[1] << "x" << bankovky[1] << ", " << pocet[2] << "x" << bankovky[2] << ", " << pocet[3] << "x" << bankovky[3] << endl << endl << pomlcky << endl << endl;
        } else {
            std::cout << "Chybna castka" << std::endl;
            goto znovu;
        }
    } else
        std::cout << "Chybne cislo karty a nebo pin" << std::endl << std::endl << pomlcky << std::endl << std::endl;
    return main();
}