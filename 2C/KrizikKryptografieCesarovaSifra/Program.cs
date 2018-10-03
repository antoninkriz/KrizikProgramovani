using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;

namespace kryptografie
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Zadej nyni 4 klice o hodnotach 0 az 57 ");
            Console.WriteLine("Klic 1: ");
            int klic1;
            while (!int.TryParse(Console.ReadLine(), out klic1)) nesparvneCislo();
            Console.WriteLine("Klic 2: ");
            int klic2;
            while (!int.TryParse(Console.ReadLine(), out klic2)) nesparvneCislo();
            Console.WriteLine("Klic 3: ");
            int klic3;
            while (!int.TryParse(Console.ReadLine(), out klic3)) nesparvneCislo();
            Console.WriteLine("Klic 4: ");
            int klic4;
            while (!int.TryParse(Console.ReadLine(), out klic4)) nesparvneCislo();
            if (!(klic1 < 57 || klic2 < 57 || klic3 < 57 || klic4 < 57 || klic1 > 0 || klic2 > 0 || klic3 > 0 || klic4 > 0)) nesparvneCislo();


            int[] bytesAsInts = { };
            Console.Clear();
            Console.WriteLine("Zadej svuj text (pouze pismena)");
            String text = Console.ReadLine();
            if (!Regex.IsMatch(text, @"^[a-zA-Z]+$")) nesparvneCislo();
            byte[] asciiBytes = Encoding.ASCII.GetBytes(text);
            foreach (int a in asciiBytes)
            {
                bytesAsInts = asciiBytes.Select(x => (int)x).ToArray();
            }
            
            int i = 0;
            foreach (int a in asciiBytes)
            {
                Console.Write(bytesAsInts[i] + " ");
                i++;
            }
            Console.WriteLine();


            int pozice = 0;
            int pocet = bytesAsInts.Length;
            Console.ReadKey();
            for (int s = 0; s < pocet; s++)
            {
                if (pozice % 4 == 0) {
                    bytesAsInts[s] = bytesAsInts[s] + klic1;
                }
                if (pozice % 4 == 1) {
                    bytesAsInts[s] = bytesAsInts[s] + klic2;
                }
                if (pozice % 4 == 2) {
                    bytesAsInts[s] = bytesAsInts[s] + klic3;
                }
                if (pozice % 4 == 3)
                {
                    bytesAsInts[s] = bytesAsInts[s] + klic4;
                }
                if (bytesAsInts[s] > 122)
                {
                    bytesAsInts[s] = bytesAsInts[s] - 57;
                }
                pozice++;
            }
            Console.WriteLine();
            for (int b = 0; b < bytesAsInts.Length; b++) {
                Console.Write(bytesAsInts[b] + " ");
            }
            Console.WriteLine();
            Console.ReadKey();

            byte[] bytes = bytesAsInts.SelectMany(BitConverter.GetBytes).ToArray();

            Console.WriteLine(Encoding.ASCII.GetString(bytes));
            Console.ReadKey();
        }



        private static void nesparvneCislo()
        {
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
