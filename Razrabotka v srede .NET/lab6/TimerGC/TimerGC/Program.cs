using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;

namespace TimerGC
{

  class Program
  {

    static void Main(string[] args)
    {
      var timer = new Timer(Method, "Hello", 0, 200);
      Console.ReadLine();
      timer.Dispose();
    }

    static void Method(object state)
    {
      Console.WriteLine(state);
      GC.Collect();
    }

  }

}
