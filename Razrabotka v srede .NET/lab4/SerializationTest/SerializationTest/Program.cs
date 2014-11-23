using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Reflection;

namespace SerializationTest
{
  class Program
  {
    public User user = null;

    public static void Main(string[] args)
    {
      Program program = new Program();
      program.Serializate();
      program.Deserializate();

      //program.Deserializate();

      Console.Read();
    }

    public void Serializate()
    {
      user = new User();
      user.login = "viktor";
      user.email = "latvit@gmail.com";
      user.password = "dsagwe23t_e2r";
      user.age = 23;

      BinaryFormatter binaryFormatter = new BinaryFormatter();
      FileStream fileStream = new FileStream("user", FileMode.OpenOrCreate, FileAccess.Write, FileShare.None);
      binaryFormatter.Serialize(fileStream, user);
      fileStream.Close();

      PrintData(user);
    }

    public void Deserializate()
    {
      BinaryFormatter binaryFormatter = new BinaryFormatter();
      FileStream fileStream = new FileStream("user", FileMode.Open, FileAccess.Read, FileShare.None);
      user = (User)binaryFormatter.Deserialize(fileStream);
      fileStream.Close();

      PrintData(user);
    }

    public void PrintData(User user)
    {
      Type type = user.GetType();
      PropertyInfo[] propertyInfo = type.GetProperties();

      foreach (PropertyInfo property in propertyInfo)
      {
        System.Console.WriteLine("{0}: {1}", property.Name, property.GetValue(user));
      }
    }

  }
}
