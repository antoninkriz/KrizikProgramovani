using System;
using System.IO;
using System.Text;

namespace loremipsum
{
    class stringgenerator
    {
        public string generate()
        {
            string[] linesj;
            string[] linesp;
            using (StreamReader srj = new StreamReader(@"jmeno.txt", Encoding.UTF8, true))
            using (StreamReader srp = new StreamReader(@"prijmeni.txt", Encoding.UTF8, true))
            {
                // Read the stream to a string, and write the string to the console.
                String linej = srj.ReadToEnd();
                String linep = srp.ReadToEnd();
                linesj = linej.Split(new string[] { Environment.NewLine }, StringSplitOptions.None);
                linesp = linep.Split(new string[] { Environment.NewLine }, StringSplitOptions.None);
            }

            string[] jmena = linesj;
            string[] prijemni = linesp;
            string[] pridavnajmena = { "Velký", "Malý", "Hloupý", "Ostříhaný" };
            string[] slovesa = { "spí", "skáká", "leze" };
            string[] spojky = { "s", "před", "nad" };
            string[] nekym = { "psem", "asiatem", "kočkou", "elektrikářem" };
            string[] slovesa2 = { "smrdí", "kouká", "píše" };
            string[] podstjm = { "bůh", "vůl", "prase", "královna" };
            string[] konec = { ".", "!" };

            String result;

            int jmnrnd = jmena.Length;
            int prjrnd = prijemni.Length;
            int prdrnd = pridavnajmena.Length;
            int slrnd = slovesa.Length;
            int sprnd = spojky.Length;
            int nkrnd = nekym.Length;
            int knrnd = konec.Length;
            int slrnd2 = slovesa2.Length;
            int pdjrmd = podstjm.Length;


            String s = " ";

            String sespojka;
            String se = nekym[rnd(nkrnd)];
            String spojka = spojky[rnd(sprnd)];
            String necem = nekym[rnd(nkrnd)];
            if (necem == "kočkou")
            {
                necem = spojka + s + necem + ", která";
            }
            else
            {
                if (spojka == "s" && necem == "psem")
                {
                    sespojka = "se" + s + necem;
                }
                else
                {
                    sespojka = spojka + s + necem;
                }
                necem = sespojka +  ", který";
            }

            
            
            

            result = pridavnajmena[rnd(prdrnd)] + s + jmena[rnd(jmnrnd)] + s + prijemni[rnd(prjrnd)] + s + slovesa[rnd(slrnd)] + s + necem + s + slovesa2[rnd(slrnd2)] + s + "jako" + s + podstjm[rnd(pdjrmd)] + konec[rnd(knrnd)];
            

            return result;
        }

        private int rnd(int i)
        {
            Random random = new Random();
            return random.Next(0, i);
        }

    }
}
