using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//Создать exceptin MyDateException
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
        this.day = 0; //throw
      }

      if (month < 1 || month > 12)
      {
        this.month = 0; //throw
      }

      if (year < 1 || year > 9999)
      {
        this.year = 0; //throw
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

    public int Difference(MyDate date)
    {
      int days1 = this.year*12 + this.month*30 + this.day;
      int days2 = date.year*12 + date.month*30 + date.day;

      if (days1 < days2)
      {
        return 0;
      }

      return days1 - days2;
    }

  }
}
