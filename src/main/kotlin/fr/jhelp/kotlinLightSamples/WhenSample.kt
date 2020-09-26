package fr.jhelp.kotlinLightSamples

fun whenWithParameter(parameter: Int)
{
    when (parameter)
    {
        0 -> println("ZERO")
        5 -> println("FIVE")
        25 -> println("Twenty five")
        42 -> println("The answer")
        73 -> println("Magic Number")
        666 ->
        {
            println("Don't play with it : ")
            println("   It is the Beast !!!")
        }
        else -> println("Nothing to say for $parameter")
    }
}

fun whenWithoutParameter(integer: Int, string: String)
{
    when
    {
        integer == 5                       -> println("FIVE")
        integer < 5 && string.isNotEmpty() -> println("$integer => $string")
        integer > 5 && string.isEmpty()    ->
        {
            println("Best car ever : DeLoreen 1985")
        }
        else                               ->
        {
            println("I have a machine gun now! Ho! Ho! Ho!")
        }
    }
}