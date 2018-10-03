using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cistpsat
{
    class Read
    {
        public void readFile()
        {
            try
            {   // Open the text file using a stream reader.
                Console.Clear();
                Console.WriteLine("Vypisuji ve tvaru: jmeno prijmeni, titul");
                using (StreamReader srj = new StreamReader(@"jmeno.txt", Encoding.UTF8, true))
                using (StreamReader srp = new StreamReader(@"prijmeni.txt", Encoding.UTF8, true))
                using (StreamReader srt = new StreamReader(@"titul.txt", Encoding.UTF8, true))
                {
                    // Read the stream to a string, and write the string to the console.
                    String linej = srj.ReadToEnd();
                    String linep = srp.ReadToEnd();
                    String linet = srt.ReadToEnd();
                    string[] linesj = linej.Split(new string[] { Environment.NewLine }, StringSplitOptions.None);
                    string[] linesp = linep.Split(new string[] { Environment.NewLine }, StringSplitOptions.None);
                    string[] linest = linet.Split(new string[] { Environment.NewLine }, StringSplitOptions.None);
                    int delka = linesj.Length;
                    Console.WriteLine("Pocet vstupu: " + delka);
                    for (int i = 0; i < delka; i++)
                    {
                        Console.WriteLine(linesj[i] + " " + linesp[i] + ", " + linest[i]);
                    }
                }

            }

            catch (Exception e)
            {
                Console.WriteLine("The file could not be read:");
                Console.WriteLine(e.Message);

                Console.ReadKey();
            }
        }
    }
}
