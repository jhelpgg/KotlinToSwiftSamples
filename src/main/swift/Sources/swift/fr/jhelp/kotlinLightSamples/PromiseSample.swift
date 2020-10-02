

func promiseTest()
{
    let promise = Promise<Int>()
    promise.getFuture()
        .andThen { number in increment(number) }
        .andThen { number in twice(number) }
        .andThen { number in print("Result : \(number)") }
    promise.result(20)
}

private func increment(_ number: Int) -> Int
{
    print("Number received : \(number)")
    return number + 1
}

private func twice(_ number: Int) -> Int
{
    print("Number incremented \(number)")
    return number * 2
}
