using System;
using System.Threading;

namespace loremipsum
{
    class Program
    {
        static void Main(string[] args)
        {
            stringgenerator st = new stringgenerator();
            for (int i = 0; i < 50; i++)
            {
                Console.WriteLine(i+1 + ": " + st.generate());
                Thread.Sleep(25);
            }
            Console.ReadKey();
        }
    }
}
