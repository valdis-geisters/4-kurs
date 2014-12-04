using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppWithoutExceptionHandling
{
  class Program
  {
    static void Main(string[] args)
    {
      Console.WriteLine("Введите число");
      int number = Convert.ToInt32(Console.ReadLine());
      Console.WriteLine("Вы ввели {0}", number);

      Console.ReadLine();
    }
  }
}
