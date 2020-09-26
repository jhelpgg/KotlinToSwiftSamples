package fr.jhelp.kotlinLightSamples

fun testWhile()
{
    var count = 1

    while (count < 1000)
    {
        println("While count=>$count")
        count *= 2
    }
}

fun testDoWhile()
{
    var count = 1

    do
    {
        println("Do while count=>$count")
        count *= 2
    }
    while (count < 1000)
}
