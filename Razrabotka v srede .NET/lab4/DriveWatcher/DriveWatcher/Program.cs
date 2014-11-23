using System;
using System.Collections.Generic;
using System.Text;
using System.Management;
using System.IO;

namespace DriveWatcher
{
  class Program
  {

    public static void Main(string[] args)
    {
      Program program = new Program();
      program.Start();

      while (true);
    }

    public void Start()
    {
      GetDriveInfo();
      LogicalDiskHandler();
    }

    public void LogicalDiskHandler()
    {
      ManagementEventWatcher watcher = null;
      try
      {
        WqlEventQuery query = new WqlEventQuery("__InstanceOperationEvent", new TimeSpan(0, 0, 1), @"TargetInstance ISA 'Win32_LogicalDisk'");
        watcher = new ManagementEventWatcher(query);
        watcher.EventArrived += new EventArrivedEventHandler(LogicalDiskOperation);
        watcher.Start();
      }
      catch (Exception ex)
      {
        Console.WriteLine(ex.Message);
        if (watcher != null)
        {
          watcher.Stop();
        }
      }
    }

    public void LogicalDiskOperation(object sender, EventArrivedEventArgs e)
    {
      GetDriveInfo();
    }

    public void GetDriveInfo()
    {
      Console.Clear();
      Console.WriteLine("***** Fun with DriveInfo *****\n");
      DriveInfo[] myDrives = DriveInfo.GetDrives();

      foreach (DriveInfo d in myDrives)
      {
        Console.WriteLine("Name: {0}", d.Name);
        Console.WriteLine("Type: {0}", d.DriveType);
        if (d.IsReady)
        {
          Console.WriteLine("Free space: {0}", d.TotalFreeSpace);
          Console.WriteLine("Format: {0}", d.DriveFormat);
          Console.WriteLine("Label: {0}", d.VolumeLabel);
        }
        Console.WriteLine();
      }
    }

  }
}