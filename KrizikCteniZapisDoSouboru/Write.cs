using System;
using System.IO;

namespace cistpsat
{
    class Write
    {
        public void writeFile()
        {
            try
            {
                Console.Clear();
                Console.WriteLine("Nyní napiš jméno");
                String jmeno = Console.ReadLine();
                Console.WriteLine("Nyní napiš příjmení");
                String prijmeni = Console.ReadLine();
                Console.WriteLine("Nyní napiš titul");
                String titul = Console.ReadLine();

                File.AppendAllText(@"jmeno.txt", Environment.NewLine + jmeno);
                File.AppendAllText(@"prijmeni.txt", Environment.NewLine + prijmeni);
                File.AppendAllText(@"titul.txt", Environment.NewLine + titul);
                Console.WriteLine();
            }
            catch (Exception e) {
                Console.WriteLine("Error writing to file: " + e);
                Console.ReadKey();
            }
        }
        
	}
}
