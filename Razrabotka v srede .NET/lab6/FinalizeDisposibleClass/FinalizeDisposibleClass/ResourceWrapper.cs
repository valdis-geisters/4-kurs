using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalizeDisposibleClass
{
  class ResourceWrapper : IDisposable
  {
    private bool disposed = false;

    public void Dispose()
    {
      CleanUp(true);
      Console.Beep();
      GC.SuppressFinalize(this);
    }

    ~ResourceWrapper()
    {
      Console.WriteLine("Destructed!!!");
      Console.Beep();
      CleanUp(false);
    }

    private void CleanUp(bool clean)
    {
      if (!this.disposed)
      {
        if (clean)
        {
          Console.WriteLine("Освобождение ресурсов");
          for (int i = 0; i < 5; i++)
          {
            Console.Write("FREE ");
          }
        }
        Console.WriteLine("Finalize");
        Console.Beep();
      }

      disposed = true;
    }
  }
}
