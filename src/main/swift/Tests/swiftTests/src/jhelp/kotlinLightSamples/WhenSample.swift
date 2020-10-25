
public func whenWithParameter(_ parameter: Int)
{
    switch parameter
    {
        case 0  :  print("ZERO")
        case 5  :  print("FIVE")
        case 25  :  print("Twenty five")
        case 42  :  print("The answer")
        case 73  :  print("Magic Number")
        case 666  : 
        do {
            print("Don't play with \(0) : ")
            print("   It is the Beast !!")
        }
        default  :  print("Nothing to say for \(parameter)")
    }
}

public func whenWithoutParameter(_ integer: Int, _ string: String)
{
    
        if integer == 5 { print("FIVE")
       } else if integer < 5 && string.isNotEmpty() { print("\(integer) => \(string)")
       } else if integer > 5 && string.isEmpty() {
            print("Best car ever : DeLoreen 1985")
        }
        else {
            print("I have a machine gun now! Ho! Ho! Ho!")
        }
    
}
