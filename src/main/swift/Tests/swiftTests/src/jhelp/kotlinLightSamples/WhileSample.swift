
public func testWhile()
{
    var count = 1

    while count < 1000
    {
        print("While count=>\(count)")
        count *= 2
    }
}

public func testDoWhile()
{
    var count = 1

    repeat
    {
        print("Do while count=>\(count)")
        count *= 2
    }
    while count < 1000
}
