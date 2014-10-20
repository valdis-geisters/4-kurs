Public Class HelloVB
    Inherits HelloCPP.HelloCPP
    Public Overrides Sub Hello()
        MyBase.Hello()
        System.Console.WriteLine("Привет из Visual Basic")
    End Sub
End Class
