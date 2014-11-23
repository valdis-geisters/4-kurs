using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PersonToFIle
{
  [Serializable]
  class Person
  {
    public String username { get; set; }
    public String code { get; set; }
    public byte age { get; set; }
  }
}
