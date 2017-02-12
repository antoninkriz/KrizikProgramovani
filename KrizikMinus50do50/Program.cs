using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace minus50to50
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] pole = new int[101];
            pole[0] = 0;
            for (int i = 0; i < 101; i++)
                pole[i] = i -50;
            foreach (int i in pole)
                Console.Write("{0} ", i);
            Console.ReadKey();
        }
    }
}
