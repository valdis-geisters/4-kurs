using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalizeDisposibleClass
{

  class Program
  {

    static void Main(string[] args)
    {
      Console.WriteLine("***** Dispose() / Destructor Combo Platter *****");
      var rw = new ResourceWrapper();
      Console.WriteLine(rw);
      Console.WriteLine(new string('-', 20));
      
      rw.Dispose();
      rw.Dispose();
      rw.Dispose();
      rw.Dispose();
      ResourceWrapper rw2 = new ResourceWrapper();

      GC.Collect();
      //GC.SuppressFinalize(rw2);

      Console.ReadLine();
    }

  }

}
