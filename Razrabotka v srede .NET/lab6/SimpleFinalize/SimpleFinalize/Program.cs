using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimpleFinalize
{

  class Program
  {

    static void Main(string[] args)
    {
      MyResourceWrapper rw = new MyResourceWrapper();
      GC.Collect();
      Console.WriteLine("***** Fun with Finalizers *****\n");
      Console.WriteLine("Hit the return key to shut down this app");
      Console.WriteLine("and force the GC to invoke Finalize()");
      Console.WriteLine("for finalizable objects created in this AppDomain");

      Console.ReadLine();
    }

  }

  class MyResourceWrapper
  {
    ~MyResourceWrapper()
    {
      for (int i = 0; i < 1000; i++)
      {
        Console.Write(".");
      }

      Console.ReadLine();
    }
  }

}
