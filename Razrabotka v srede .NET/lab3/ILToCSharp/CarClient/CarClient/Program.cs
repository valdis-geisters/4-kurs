using System;
using CILCars;

namespace CarClient
{
  class Program
  {
    static void Main(string[] args)
    {
      CILCar c = new CILCar(55, "Junior");
      CILCarInfo.Display(c);
    }
  }
}
