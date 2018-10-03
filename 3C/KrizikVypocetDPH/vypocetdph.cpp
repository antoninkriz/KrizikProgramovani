#include <iostream>
#include <cstdlib>

using std::cout;
using std::cin;
using std::endl;
using std::string;
using std::fixed;

const string nums = "0123456789.";

double vypocetCenySDPH(double *dph, double *cena) {
    double dphprocenta = ((double)*dph / 100.0) + 1.0;
    return (double)(dphprocenta * *cena);
}

double vypocetDPHZCeny(double *dph, double *cena) {
    return vypocetCenySDPH(dph, cena) - *cena;
}

void shouldContinue(bool *shouldContinue) {
    char input;
    cout << "Chcete pokracovat? (Y/n)" << endl;
    cin >> input;

    if (input == 'n' || input == 'N') {
        *shouldContinue = false;
    }
}

int main(){
    cout.precision(2);

    bool repeat = true;

    do {
        string dph, castka;
        cout << "Zadejte DPH (%): ";
        cin >> dph;
        cout << "Zadejte castku (CZK): ";
        cin >> castka;

        if (dph.find_first_not_of(nums) != string::npos || castka.find_first_not_of(nums) != string::npos)
        {
            cout << "Neplatny vstup" << endl;
            shouldContinue(&repeat);
            continue;
        }

        double d = strtod(dph.c_str(), 0);
        double c = strtod(castka.c_str(), 0);

        cout << "--------------------------------" << endl;
        cout << "DPH (%): " << dph << endl;
        cout << "Castka bez DPH: " << castka << "(CZK)" << endl;
        cout << "Castka s DPH: " << fixed << vypocetCenySDPH(&d, &c) << " CZK" << endl;
        cout << "DPH z castky: " << fixed << vypocetDPHZCeny(&d, &c) << " CZK" << endl;
        cout << "--------------------------------" << endl;
        shouldContinue(&repeat);
        cout << "--------------------------------" << endl;
        cout << "--------------------------------" << endl;
        cout << "--------------------------------" << endl;
    } while (repeat);

    return 0;
}
