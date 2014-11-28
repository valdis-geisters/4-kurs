using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Generation_GC
{
  class Car
  {
    private int speed;
    private string name;

    public Car(string name, int speed)
    {
      this.name = name;
      this.speed = speed;
    }

    public override string ToString()
    {
      return string.Format("{0} едет со скоростью {1} км/ч", name, speed);
    }
  }
}
