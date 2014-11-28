using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exceptions
{
  public class MyDateException : Exception
  {

    public MyDateException() { }

    public MyDateException(string message) : base(message) { }

    public MyDateException(string message, Exception inner) : base(message, inner) { }

  }
}
