
public func main()
{
    delayTask(16) { print("some time after") }

    for count in 0 ..< 10
    {
        let value = count
        launchTask { print("Current count = \(value)") }
    }

    let mutex = Mutex()

    for i in 1...10
    {
        let ii = i
        delayTask(1) { mutex.safeExecute { print("i=\(ii)") } }
    }

    print("apple = \(Apple().sugarValue())")
    let queue = Queue<String>()
    queue.enqueue("Hello")
    queue.enqueue("World")

    do
    {
        var value = try  queue.dequeue()
        print("1) \(value)")
        value = try  queue.dequeue()
        print("2) \(value)")
        print("Empty = \(queue.isEmpty())")
    }
    catch
    {
        print(error)
    }

    var list = Array<String>()
    list.append("Hello")
    list.append("World")
    list.append("as")
    list.append("always")
    print("list size = \(list.count)")
    var inside = list.contains("Hello")
    print("list contains 'Hello' = \(inside)")
    inside = list.contains("Something")
    print("list contains 'Something' = \(inside)")

    for (index, element) in list.enumerated()
    {
        print("\(index) => \(element)")
    }

    for element in list
    {
        print(element)
    }

    list.remove(at : 1)

    print("list size = \(list.count)")

    for element in list
    {
        print(element)
    }

    list.removeAll()
    print("list size = \(list.count)")

    var map = Dictionary<Int, String>()
    map[5] = "Five"
    map[0] = "Zero"
    map[42] = "The answer"
    map[73] = "Magic number"
    map[666] = "Beast"
    map[7777777] = "Luck"

    print("map count = \(map.count)")

    for (key, value) in map
    {
        print("key=\(key) <=> value=\(value)")
    }

    for key in map.keys
    {
        print("key=\(key)")
    }

    for value in map.values
    {
        print("value=\(value)")
    }

    var message = map[7777777]
                  ?? "No value"
    print(" @@@7777777 > \(message)")
    message = map[7]
              ?? "No value"
    print(" @@@7 > \(message)")

    let transformer = IntToString()
    var source = 5
    var result = transformer.transform(source)
    print("\(source) => \(result)")
    source = 25
    result = transformer.transform(source)
    print("\(source) => \(result)")

    CompanionTest.staticMethod()
    let companionTest = CompanionTest()
    companionTest.instanceMethod()

    let car1 = Car("DeLorean", 1985)
    let car2 = Car("Tesla")

    print("car1 : \(car1.model) ; \(car1.year) / \(car1)")
    print("car2 : \(car2.model) ; \(car2.year) / \(car2)")

    let same = car1 == car2
    print("same car : \(same)")
    let lower = car1 < car2
    print("lower car : \(lower)")

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
    print("\(status)")
    status = Status.CONNECTING
    print("\(status)")
    status = Status.CONNECTED
    print("\(status)")

    var value = 0
    print("value=\(value)")
    value += 1
    print("value=\(value)")
    value -= 1
    print("value=\(value)")

    print(" -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1")
    readInt8()
    print(" -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1")
    readInt16()
    print(" -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1")
    readInt32()
    print(" -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1")
    readInt64()
    print(" -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1")
    readFloat()
    print(" -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1")
    readDouble()
    print(" -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1 -= 1")

    promiseTest()

    let test1 = EqualsTest("poire")
    let test2 = EqualsTest("poire")
    let test3 = EqualsTest("pear")
    let equals1_2_call = test1.equals(test2)
    let equals1_2 = test1 == test2
    let equals1_3_call = test1.equals(test3)
    let equals1_3 = test1 == test3
    print("equals1_2_call=\(equals1_2_call) equals1_2=\(equals1_2) equals1_3_call=\(equals1_3_call) equals1_3=\(equals1_3)")

    let compare1 = ComparableTest("yoyo", 5)
    let compare2 = ComparableTest("youpi", 55)
    let lowerCompare = compare1 < compare2
    print("lowerCompare=\(lowerCompare)")

    let toString = ToString()
    print(toString)

    var data = Array<Byte>()
    // -2 : Int16 in little endian
    data.append(0xFE.toByte())
    data.append(0xFF.toByte())

    let bluetoothFrame = BluetoothFrame(data)
    let valueInt16 = bluetoothFrame.getInt16()
    print("valueInt16 = \(valueInt16)")

    for count in 0 ..< 10000000
    {

    }
}
