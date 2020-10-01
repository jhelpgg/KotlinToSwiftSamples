import fr.jhelp.kotlinLight.CommonList
import fr.jhelp.kotlinLight.CommonMap
import fr.jhelp.kotlinLight.Mutex
import fr.jhelp.kotlinLight.Try
import fr.jhelp.kotlinLightSamples.Apple
import fr.jhelp.kotlinLightSamples.Car
import fr.jhelp.kotlinLightSamples.CompanionTest
import fr.jhelp.kotlinLightSamples.IntToString
import fr.jhelp.kotlinLightSamples.Queue
import fr.jhelp.kotlinLightSamples.Status
import fr.jhelp.kotlinLightSamples.delayTask
import fr.jhelp.kotlinLightSamples.launchTask
import fr.jhelp.kotlinLightSamples.readDouble
import fr.jhelp.kotlinLightSamples.readFloat
import fr.jhelp.kotlinLightSamples.readInt16
import fr.jhelp.kotlinLightSamples.readInt32
import fr.jhelp.kotlinLightSamples.readInt64
import fr.jhelp.kotlinLightSamples.readInt8
import fr.jhelp.kotlinLightSamples.testDoWhile
import fr.jhelp.kotlinLightSamples.testWhile
import fr.jhelp.kotlinLightSamples.whenWithParameter
import fr.jhelp.kotlinLightSamples.whenWithoutParameter

fun main()
{
    delayTask(16) { println("some time after") }

    for (count in 0 until 10)
    {
        val value = count
        launchTask { println("Current count = $value") }
    }

    val mutex = Mutex()

    for (i in 1..10)
    {
        val ii = i
        delayTask(1) { mutex.safeExecute { println("i=$ii") } }
    }

    println("apple = ${Apple().sugarValue()}")
    val queue = Queue<String>()
    queue.enqueue("Hello")
    queue.enqueue("World")

    try
    {
        @Try var value = queue.dequeue()
        println("1) $value")
        @Try value = queue.dequeue()
        println("2) $value")
        println("Empty = ${queue.isEmpty()}")
    }
    catch (error: Exception)
    {
        println(error)
    }

    var list = CommonList<String>()
    list.append("Hello")
    list.append("World")
    list.append("as")
    list.append("always")
    println("list size = ${list.count}")
    var inside = list.contains("Hello")
    println("list contains 'Hello' = $inside")
    inside = list.contains("Something")
    println("list contains 'Something' = $inside")

    for ((index, element) in list.enumerated())
    {
        println("$index => $element")
    }

    for (element in list)
    {
        println(element)
    }

    list.remove(at = 1)

    println("list size = ${list.count}")

    for (element in list)
    {
        println(element)
    }

    list.removeAll()
    println("list size = ${list.count}")

    var map = CommonMap<Int, String>()
    map[5] = "Five"
    map[0] = "Zero"
    map[42] = "The answer"
    map[73] = "Magic number"
    map[666] = "Beast"
    map[7777777] = "Luck"

    println("map count = ${map.count}")

    for ((key, value) in map)
    {
        println("key=$key <=> value=$value")
    }

    for (key in map.keys)
    {
        println("key=$key")
    }

    for (value in map.values)
    {
        println("value=$value")
    }

    var message = map[7777777]
                  ?: "No value"
    println(" @@@7777777 > $message")
    message = map[7]
              ?: "No value"
    println(" @@@7 > $message")

    val transformer = IntToString()
    var source = 5
    var result = transformer.transform(source)
    println("$source => $result")
    source = 25
    result = transformer.transform(source)
    println("$source => $result")

    CompanionTest.staticMethod()
    val companionTest = CompanionTest()
    companionTest.instanceMethod()

    val car1 = Car("DeLorean", 1985)
    val car2 = Car("Tesla")

    println("car1 : ${car1.model} ; ${car1.year}")
    println("car2 : ${car2.model} ; ${car2.year}")

    testWhile()
    testDoWhile()

    whenWithParameter(25)
    whenWithParameter(666)
    whenWithParameter(7777777)

    whenWithoutParameter(2, "rer")
    whenWithoutParameter(25, "")
    whenWithoutParameter(5, "")
    whenWithoutParameter(55, "Ploki")

    var status = Status.DISCONNECTED
    println("$status")
    status = Status.CONNECTING
    println("$status")
    status = Status.CONNECTED
    println("$status")

    var value = 0
    println("value=$value")
    value++
    println("value=$value")
    value--
    println("value=$value")

    println("--------------------")
    readInt8()
    println("--------------------")
    readInt16()
    println("--------------------")
    readInt32()
    println("--------------------")
    readInt64()
    println("--------------------")
    readFloat()
    println("--------------------")
    readDouble()
    println("--------------------")

    for (count in 0 until 10000000)
    {

    }
}
