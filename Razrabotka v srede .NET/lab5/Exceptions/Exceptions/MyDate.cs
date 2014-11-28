using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exceptions
{
  class MyDate
  {

    private byte day;
    private byte month;
    private ushort year;

    public MyDate(byte day, byte month, ushort year)
    {
      if (day < 1 || day > 30)
      {
        throw new MyDateException("День не может быть меньше 0 и больше 30");
      }

      if (month < 1 || month > 12)
      {
        throw new MyDateException("Месяц не может быть меньше 0 и больше 12");
      }

      if (year < 1 || year > 9999)
      {
        throw new MyDateException("Год не может быть меньше 0 и больше 9999");
      }

      this.day = day;
      this.month = month;
      this.year = year;
    }

    public string GetDate()
    {
      string day = Convert.ToString(this.day);
      string month = Convert.ToString(this.month);
      string year = Convert.ToString(this.year);
      string date = day + "." + month + "." + year;

      return date;
    }

    public uint Difference(MyDate date)
    {
      uint days1 = 0;
      uint days2 = 0;

      try
      {
        days1 = Convert.ToUInt32(this.year * 12 * 30 + this.month * 30 + this.day);
        days2 = Convert.ToUInt32(date.year * 12 * 30 + date.month * 30 + date.day);
      }
      catch (Exception exepction)
      {
        throw new MyDateException("Упс. Что-то пошло не так.");
      }

      if (days1 < days2)
      {
        throw new MyDateException("Первая дата не может быть меньше второй.");
      }

      return days1 - days2;
    }

  }
}
