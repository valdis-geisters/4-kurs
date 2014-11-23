using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace PersonsWatcher
{
  class Program
  {
    static void Main(string[] args)
    {
      Console.WriteLine("**** The File Watcher App ****");
      FileSystemWatcher watcher = new FileSystemWatcher();
      try
      {
        watcher.Path = @".\person";
      }
      catch (ArgumentException ex)
      {
        Console.WriteLine(ex.Message);
        Console.Read();
        return;
      }

      watcher.NotifyFilter = NotifyFilters.LastAccess | NotifyFilters.LastWrite | NotifyFilters.FileName | NotifyFilters.DirectoryName;

      watcher.Filter = "persons.dat";

      watcher.Changed += new FileSystemEventHandler(OnChanged);
      watcher.Created += new FileSystemEventHandler(OnChanged);
      watcher.Deleted += new FileSystemEventHandler(OnDeleted);
      watcher.Renamed += new RenamedEventHandler(OnRenamed);

      watcher.EnableRaisingEvents = true;

      Console.WriteLine(@"Press q to quit app");
      while (Console.Read() != 'q');
    }

    static void OnChanged(object source, FileSystemEventArgs e)
    {
      Console.WriteLine("File: {0} {1}!", e.FullPath, e.ChangeType);
    }

    static void OnDeleted(object source, FileSystemEventArgs e)
    {
      Console.WriteLine("The file {0} is {1}", e.Name, e.ChangeType.ToString().ToLower());
    }

    static void OnRenamed(object source, RenamedEventArgs e)
    {
      Console.WriteLine("File: {0} renamed to {1}", e.OldFullPath, e.FullPath);
    }
  }
}
