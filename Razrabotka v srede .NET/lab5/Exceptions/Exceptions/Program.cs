using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exceptions
{
  class Program
  {
    
    static void Main(string[] args)
    {
      Console.WriteLine("Программа вычисляет разность между двумя датами в днях\n");

      try
      {
        byte day = 0;
        byte month = 0;
        ushort year = 0;

        Console.WriteLine("Введите первую дату");
        setParameters(ref day, ref month, ref year);
        MyDate date1 = new MyDate(day, month, year);

        Console.WriteLine("\nВведите вторую дату");
        setParameters(ref day, ref month, ref year);
        MyDate date2 = new MyDate(day, month, year);

        Console.WriteLine("\nВведеная первая дата: {0}", date1.GetDate());
        Console.WriteLine("Введеная вторая дата: {0}", date2.GetDate());

        uint difference = date1.Difference(date2);
        Console.WriteLine("\nРазность между двумя датами: {0} дней\n", difference);
      } 
      catch(FormatException formatException) 
      {
        Console.WriteLine("\n" + formatException.Message + "\n");
      }
      catch(OverflowException overflowException)
      {
        Console.WriteLine("\n" + overflowException.Message + "\n");
      }
      catch(MyDateException dateException)
      {
        Console.WriteLine("\n" + dateException.Message + "\n");
      }
      catch (Exception exception) 
      {
        Console.WriteLine("\n" + exception.Message + "\n");
      }

      Console.WriteLine("Для завершения программы нажмите любую клавишу");
      Console.ReadKey();
    }

    static void setParameters(ref byte day, ref byte month, ref ushort year)
    {
      Console.Write("День >");
      day = Convert.ToByte(Console.ReadLine());
      Console.Write("Месяц >");
      month = Convert.ToByte(Console.ReadLine());
      Console.Write("Год >");
      year = Convert.ToUInt16(Console.ReadLine());
    }

  }
}
