using System;
using System.Threading;

namespace Rekurze_faktorial
{
    class Program
    {
      
        static int faktorial(int u) {
            if (u <= 1)
                return 1;
            return u * faktorial(u - 1);
        }


        static void Main(string[] args) {

            Console.Write("Zadej číslo: ");
            int a;
            while (!int.TryParse(Console.ReadLine(), out a)) nesparvneCislo();
            int n = a;
            int r = faktorial(n);
            Console.WriteLine("Rekurzivní faktoriál: " + n.ToString() + "! = " + r.ToString());
            Console.ReadKey();

        }

        private static void nesparvneCislo() {
            Console.Clear();
            Console.Beep(659, 125);
            Console.Beep(659, 125);
            Thread.Sleep(125);
            Console.Beep(659, 125);
            Thread.Sleep(167);
            Console.Beep(523, 125);
            Console.Beep(659, 125);
            Thread.Sleep(125);
            Console.Beep(784, 125);
            Thread.Sleep(375);
            Console.Beep(392, 125);
            Console.WriteLine("ZASE JSI TO ZKAZIL! KONČÍŠ!");
            Console.ReadKey();
            System.Environment.Exit(1);
        }

    }
}
