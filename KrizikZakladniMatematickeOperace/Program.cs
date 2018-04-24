/* 
*  Created by Antonín Kříž
*  15.9.2016
*  This code is (maybe) under Apache Licence, Version 2.0 (https://www.apache.org/licenses/LICENSE-2.0) so dont try to steal this code xddddddd and if u do plz tag this dank memer in ur code bcoz this code is hax lmao so lit
*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace vypocet
{
    class Program
    {
        static void Main(string[] args)
        {
            //Svátek - why? hesteg zadani ucitele
            String jemno;
            Console.WriteLine("Jak se jmenuješ?");
            jemno = Console.ReadLine();
            Console.WriteLine("Vše nejlepší k svátku, " + jemno + "!"); 

            //Zadani cisel uzivatelem
            Console.WriteLine("Zadejte prvni cislo (zakladni hodnota je 1)");
            float a;
            while (!float.TryParse(Console.ReadLine(), out a))
                nesparvneCislo();
            

            Console.WriteLine("Zadejte druhe cislo (zakladni hodnota je 1)");
            float b;
            while (!float.TryParse(Console.ReadLine(), out b))
                nesparvneCislo();

            Console.Clear(); //Vycisteni konzole

            //Vypocty
            float scitani = a + b;
            float odcitani = a - b;
            float nasobeni = a * b;
            float delit = a / b;

            //Vypis vypoctu
            Console.WriteLine("Prvni cislo: " + a);
            Console.WriteLine("Druha cislo: " + b);
            Console.WriteLine();
            Console.WriteLine("scitani: " + scitani);
            Console.WriteLine("odcitani: " + odcitani);
            Console.WriteLine("nasobeni: " + nasobeni);
            Console.WriteLine("deleni: " + delit);
            Console.WriteLine();
            Console.WriteLine("Stisknete jakoukoli klavesu pro ukonceni");
            Console.ReadKey();

            Console.Clear();
            Console.WriteLine("soucet={0}, rozdil={1}, nasobek={2}, podil={3}", scitani, odcitani, nasobeni, delit);
        }

        private static void nesparvneCislo()
        {
            Console.Clear();
            Console.WriteLine("Neplatna hodnota");
            Console.ReadKey();
            System.Environment.Exit(1);
        }
    }
}
