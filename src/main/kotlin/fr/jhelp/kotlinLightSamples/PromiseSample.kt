package fr.jhelp.kotlinLightSamples

import fr.jhelp.kotlinLigthTools.promise.Promise

fun promiseTest()
{
    val promise = Promise<Int>()
    promise.getFuture()
        .andThen { number -> increment(number) }
        .andThen { number -> twice(number) }
        .andThen { number -> println("Result : $number") }
    promise.result(20)
}

private fun increment(number: Int): Int
{
    println("Number received : $number")
    return number + 1
}

private fun twice(number: Int): Int
{
    println("Number incremented $number")
    return number * 2
}