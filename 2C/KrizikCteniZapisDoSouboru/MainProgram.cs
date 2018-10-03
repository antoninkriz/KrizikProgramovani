using System;
using System.Collections.Generic;

namespace cistpsat
{
    class MainProgram
    {
        public List<string> values = new List<string>();
        public 
        static void Main(string[] args)
        {
            MainProgram m = new MainProgram();
            m.start();
        }

        public void start() {
            Console.Clear();
            Console.WriteLine("Pro čtení zvotle malé písmeno C, pro zápis malé Z");
            String read = Console.ReadLine();

            if (read.Equals("c"))
            {
                Read r = new Read();
                r.readFile();
                Console.ReadKey();
                start();
            }
            else if (read.Equals("z"))
            {
                Write w = new Write();
                w.writeFile();
                Console.WriteLine("Zapsáno");
                Console.ReadKey();
                start();
            }
            else if (read.Equals(""))
            {
                Console.Clear();
                Console.WriteLine("Restartuju");
                Console.ReadKey();
                start();
            }
            else
            {
                Console.Clear();
                Console.WriteLine("ZKAZIL JSI TO!");
                Console.ReadKey();
                Console.Clear();
                Console.WriteLine("Restartuju");
                Console.ReadKey();
            }
        }
    }
}
