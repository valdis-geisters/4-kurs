using System;
using System.Windows.Forms;

namespace CILCars
{
    public class CILCarInfo
    {
      public static void Display(CILCar c)
      {
        string caption = string.Format("{0}'s speed is:", c.petName);
        MessageBox.Show(c.currSpeed.ToString(), caption);
      }
    }
}
