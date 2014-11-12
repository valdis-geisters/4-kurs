// Ссылки на внешние сборки
.assembly extern mscorlib
{
	.publickeytoken = (B7 7A 5C 56 19 34 E0 89)
	.ver 4:0:0:0
}

.assembly extern CILCars
{
	.ver 1:0:0:0
}

// Исполняемая сборка
.assembly CarClient
{
	.hash algorithm 0x00008004
	.ver 1:0:0:0
}
.module CarClient.exe

// Реализация типа Program
.namespace CarClient
{
	.class private auto ansi beforefieldinit Program extends [mscorlib]System.Object
	{
		.method private hidebysig static void FOOBAR(string[] args) cil managed
		{
			// Поместить точку входа в *.exe
			.entrypoint
			.maxstack 8

			// Объявить локальную переменнуб CILCar и поместить
			// значения в стек для вызова конструктора
			.locals init ([0] class [CILCars]CILCars.CILCar myCilCar)
			ldc.i4 55
			ldstr "Junior"

			// Создать новый объект CilCar; сохранить и загрузить ссылку на него
			newobj instance void [CILCars]CILCars.CILCar::.ctor(int32, string)
			stloc.0
			ldloc.0

			// Вызвать метод Display() с передачей ему
			// самого верхнего значения из стека
			call void [CILCars]
			CILCars.CILCarInfo::Display(class [CILCars]CILCars.CILCar)
			ret
		}
	}
}