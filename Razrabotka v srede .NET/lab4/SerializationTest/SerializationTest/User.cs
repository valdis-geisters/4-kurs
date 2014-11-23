using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SerializationTest
{
  [Serializable]
  class User
  {
    public String login { get; set; }
    //public String firstname { get; set; }
    //public String lastname { get; set; }
    public String email { get; set; }
    public String password { get; set; }
    public byte age { get; set; }
  }
}
