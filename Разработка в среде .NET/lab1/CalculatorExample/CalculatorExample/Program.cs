using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CalculatorExample
{
    class Program
    {
        class Calc
        {
            public int Add(int x, int y) { return x + y; }
        }

        static void Main(string[] args)
        {
            Calc c = new Calc();
            int ans = c.Add(10, 84);

            Console.WriteLine("10 + 84 is {0}.", ans);
            Console.ReadLine();
        }
    }
}
