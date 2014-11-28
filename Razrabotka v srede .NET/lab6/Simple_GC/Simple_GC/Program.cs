using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;

namespace Simple_GC
{
  class Program
  {
    static void Main(string[] args)
    {
      var tests = new Test[1000];

      try
      {
        for (int i = 0; i < tests.Length; i++)
        {
          tests[i] = new Test();
          tests[i].Method(i);

          /*Test test = new Test();
          test.Method(i);*/
        }
      } catch(OutOfMemoryException exception)
      {
        Console.ForegroundColor = ConsoleColor.Red;
        Console.WriteLine(exception.Message);
        Console.WriteLine("Управляемая куча переполнена");
        Console.ForegroundColor = ConsoleColor.Gray;
      }

      Console.ReadLine();
    }
  }
}
