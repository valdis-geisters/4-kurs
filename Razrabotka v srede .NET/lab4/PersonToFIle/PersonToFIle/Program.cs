using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Collections;
using System.Runtime.Serialization.Formatters.Binary;

namespace PersonToFIle
{
  class Program
  {
    DirectoryInfo directory;
    FileInfo file;
    FileStream fileStream;
    BinaryFormatter binaryFormatter;
    ArrayList persons;
    Person person;

    Program()
    {
      directory = new DirectoryInfo(@".\person");
      file = new FileInfo(@".\person\persons.dat");

      if (directory.Exists)
      {
        Console.WriteLine("The folder person exist!");
      }
      else
      {
        Console.WriteLine("Folder person does not exist!\nCreating folder person");
        directory.Create();
      }

      if (file.Exists)
      {
        Console.WriteLine("The file persons.dat exist!");
        Console.WriteLine("***************************");
        Console.WriteLine("File name: {0}", file.Name);
        Console.WriteLine("File size: {0}", file.Length);
        Console.WriteLine("Creation: {0}", file.CreationTime);
        Console.WriteLine("Attributes: {0}", file.Attributes);
        Console.WriteLine("***************************\n");

        fileStream = file.Open(FileMode.Open, FileAccess.ReadWrite, FileShare.None);
      }
      else
      {
        Console.WriteLine("The file persons.dat does not exist!\nCreating file persons.dat\n");
        fileStream = file.Create();
      }

      binaryFormatter = new BinaryFormatter();
      persons = new ArrayList();
    }

    void start()
    {
      if (file.Exists && file.Length > 0)
      {
        persons = (ArrayList) binaryFormatter.Deserialize(fileStream);
        fileStream.Position = 0;
      }

      if (persons.Count > 0)
      {
        Console.Write("Do you want output file? (y/n)? ");
        if (Console.ReadKey().KeyChar == 'y')
        {
          outputData();
        }
        else
        {
          Console.WriteLine("\n");
        }
      }

      bool show = true;
      if (persons.Count > 0)
      {
        Console.Write("Do you want input file? (y/n)? ");
        if (Console.ReadKey().KeyChar == 'y')
        {
          Console.WriteLine("\n");
          inputData();
        }
        else
        {
          show = false;
          Console.WriteLine("\n");
        }
      }
      else
      {
        inputData();
      }

      if (show)
      {
        Console.Write("Do you want output data? (y/n)? ");
        if (Console.ReadKey().KeyChar == 'y')
        {
          Console.ReadKey();
          outputData();
        }
        else
        {
          Console.WriteLine("\n");
        }

        Console.WriteLine("Save object to file\n");
        try
        {
          binaryFormatter.Serialize(fileStream, persons);
        }
        catch (Exception ex) { }
        finally
        {
          fileStream.Close();
        }
      }

    }

    static void Main(string[] args)
    {
      Program program = new Program();
      program.start();

      Console.Write("Press any key to exit");
      Console.ReadKey();
    }

    void inputData()
    {
      do
      {
        if (person != null)
        {
          Console.ReadKey();
          Console.WriteLine("\n");
        }
        person = new Person();

        Console.Write("Enter username: ");
        person.username = Console.ReadLine();

        Console.Write("Enter personal code: ");
        person.code = Console.ReadLine();

        Console.Write("Enter age: ");
        person.age = Convert.ToByte(Console.ReadLine());

        persons.Add(person);

        Console.Write("\nDo you wan't to continue? (y/n)? ");
      } while (Console.ReadKey().KeyChar == 'y');

      Console.WriteLine("\n");
    }

    void outputData()
    {
      Console.WriteLine();
      for (int i = 0; i < persons.Count; i++)
      {
        person = (Person)persons[i];
        Console.WriteLine("\n{0}. **********", i);
        Console.WriteLine("Username: {0}", person.username);
        Console.WriteLine("Personal code: {0}", person.code);
        Console.WriteLine("Age: {0}", person.age);
      }

      person = null;
      Console.WriteLine();
    }

  }
}
