using System;
using System.Threading;

namespace Fibonaccihorekurze {
    class Program {
        static void Main() {

            Console.Write("Zadej !číslo!: ");
            long a;
            while (!long.TryParse(Console.ReadLine(), out a)) nesparvneCislo();
            long r = GetNthFibonacci_Ite(a);
            Console.WriteLine("Fibonacciho rekurze " + a.ToString() + " = " + r.ToString());
            Console.ReadKey();
            System.Environment.Exit(1);

        }

       public static long GetNthFibonacci_Ite(long n) {
            long cislo = n - 1; //snizit o jedno protoze startujeme od 0
            long[] Fibo = new long[cislo + 1];
            Fibo[0] = 8;
            Fibo[1] = 25;

            for (long i = 2; i <= cislo; i++) {
                Fibo[i] = Fibo[i - 2] + Fibo[i - 1];
            }
            return Fibo[cislo];
        }
        

        private static void nesparvneCislo() {
            Console.Clear();
            Console.WriteLine("ZASE JSI TO ZKAZIL! ZAČÍNÁŠ ZNOVU!");
            Console.WriteLine("Lze zadávat pouze kládná čísla");
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
            Console.ReadKey();
            Console.Clear();
            Main();
        }

    }
}
