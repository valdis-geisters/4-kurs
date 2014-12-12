using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;

namespace Generation_GC
{
  class Program
  {
    static void Main(string[] args)
    {
      Thread.Sleep(4000);
      Console.WriteLine("Размер памяти в байтах в управляемой куче: {0}", GC.GetTotalMemory(false));
      Console.WriteLine("Система поддерживает {0} поколений", GC.MaxGeneration + 1);

      Car car = new Car("Volvo", 120);
      Console.WriteLine(car.ToString());
      Console.WriteLine("Объект car относится к {0} поколению", GC.GetGeneration(car));
      Console.WriteLine("Размер памяти в байтах в управляемой куче: {0}", GC.GetTotalMemory(false));

      object[] arr = new object[10000000];
      ShowGCStat();

      for (int i = 0; i < arr.Length; i++)
      {
        arr[i] = new object();
      }

      Console.WriteLine("Размер памяти в байтах в управляемой куче: {0}", GC.GetTotalMemory(false));
      arr = null;

      Console.WriteLine("Массив построен, запускаем GC");
      ShowGCStat();

      var start = DateTime.Now;
      GC.Collect();
      //GC.WaitForPendingFinalizers();

      Console.WriteLine("GC отработал " + (DateTime.Now - start).Milliseconds);
      Console.WriteLine("Размер памяти в байтах в управляемой куче: {0}", GC.GetTotalMemory(false));
      Console.WriteLine("Объект car относится к {0} поколению", GC.GetGeneration(car));

      ShowGCStat();

      Console.ReadLine();
    }

    private static void ShowGCStat()
    {
      Console.WriteLine("Поколение 0 проверялось {0} раз", GC.CollectionCount(0));
      Console.WriteLine("Поколение 1 проверялось {0} раз", GC.CollectionCount(1));
      Console.WriteLine("Поколение 2 проверялось {0} раз", GC.CollectionCount(2));
    }
  }
}
