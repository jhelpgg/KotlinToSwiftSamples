//main()
/*
let value = 0b00001111
print("value=\(value)")

let squareRoot = sqrt(Float(4))
print("squareRoot=\(squareRoot)")

let timeCalendar = TimeCalendar()
print("year=\(timeCalendar.year())")
print("month=\(timeCalendar.month())")
print("dayOfMonth=\(timeCalendar.dayOfMonth())")
print("dayOfWeek=\(timeCalendar.dayOfWeek())")
print("hour=\(timeCalendar.hour())")
print("minute=\(timeCalendar.minute())")
print("second=\(timeCalendar.second())")

let minimum = min(4, 5)
let maximum = max(4, 5)

print("\(minimum) <= \(maximum)")

var value1 = 0xCAFEFACE
var hexa = toHexadecimal(value1)
var reverse = formHexadecimal(hexa)

print("\(value1) / \(value1 - 0x100000000) => \(hexa) => \(reverse)")

value1 = -123
hexa = toHexadecimal(value1)
reverse = formHexadecimal(hexa)

print("\(value1) => \(hexa) => \(reverse) => \(abs(value1))") 

value1 = 123
hexa = toHexadecimal(value1)
reverse = formHexadecimal(hexa)
print("\(value1) => \(hexa) => \(reverse)") 

hexa = toHexadecimal(value1, 5)
reverse = formHexadecimal(hexa)
print("\(value1) => \(hexa) => \(reverse)") 


let child = Child(5, 42)
print("child : value=\(child.value)  number=\(child.number) compute=\(child.compute)")
*/

func addSomething(_ array: inout Array<String>)
{
	array.append("Something")    
}

var array = Array<String>()
array.append("First")

print("BEFORE")

for element in array
{
	print(" => \(element)")
}

addSomething(array)

print("AFTER")

for element in array
{
	print(" => \(element)")
}





