// ссылки на mscorlib.dll и
// System.Windows.Forms.dll
.assembly extern mscorlib
{
	.publickeytoken = (B7 7A 5C 56 19 34 E0 89)
	.ver 4:0:0:0
}

.assembly extern System.Windows.Forms
{
	.publickeytoken = (B7 7A 5C 56 19 34 E0 89)
	.ver 4:0:0:0
}

// Определить однофайловую сборку
.assembly CILCars
{
	.hash algorithm 0X00008004
	.ver 1:0:0:0
}
.module CILCars.dll

// Реализация типа CILCars.CILCar
.namespace CILCars
{
	.class public auto ansi beforefieldinit CILCar extends [mscorlib]System.Object
	{
    // Поля данных CILCar
	  .field public string petName
	  .field public int32 currSpeed
	
	  // Конструктор - позволяет вызывающему коду присваивать поля данных
	  .method public hidebysig specialname rtspecialname instance void .ctor(int32 c, string p) cil managed
    {
	    .maxstack 8
	
	    // Загрузить первый аргумент в стек и вызвать конструктор базового класса
	    ldarg.0  // this
	    call instance void [mscorlib]System.Object::.ctor()
	
	    // Загрузить первый аргумент в стек
	    ldarg.0
	    ldarg.1
	
	    // Сохранить самый верхний элемент стека в поле currSpeed
	    stfld int32 CILCars.CILCar::currSpeed
	
	    // Загрузить строковый аргумент в стек и сохранить его в поле petName
	    ldarg.0
	    ldarg.2
	    stfld string CILCars.CILCar::petName
	    ret
	  }
  }
	
  .class public auto ansi beforefieldinit CILCarInfo extends [mscorlib]System.Object
  {
	  .method public hidebysig static void Display(class CILCars.CILCar c) cil managed
    {
		  .maxstack 8
		
		  // нам нужна локальная строковая переменная
		  .locals init ([0] string caption)
		
		  // загрузка строки и выходного параметра CILCar в стек
		  ldstr "{0}'s speed is:"
		  ldarg.0
		
		  // поместить в стек значение поля petName из CILCar 
		  // и вызвать статический метод String.Format()
		  ldfld string CILCars.CILCar::petName
		  call string [mscorlib]System.String::Format(string, object)
		  stloc.0
		
		  // загрузить значение поля currSpeed и получить его строковое
      // представление (обрати внимание на ToString())
		  ldarg.0
		  ldflda int32 CILCars.CILCar::currSpeed
		  call instance string [mscorlib]System.Int32::ToString()
		  ldloc.0
		
		  // Вызвать метод MessageBox.Show() с загруженными значениями
		  call valuetype [System.Windows.Forms]
		    System.Windows.Forms.DialogResult
		    [System.Windows.Forms]
		    System.Windows.Forms.MessageBox::Show(string, string)
		  pop
		  ret
		}
	}
}