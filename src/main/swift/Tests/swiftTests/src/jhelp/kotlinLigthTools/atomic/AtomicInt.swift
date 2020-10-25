

public class AtomicInt {

    private let mutex: Mutex
    private var value: Int

    public init(_ value: Int){
        self.mutex = Mutex()
        self.value = value
    }

    public func get() -> Int
    {
        var value = 0
        self.mutex.safeExecute { value = self.value }
        return value
    }

    public func set(_ value: Int)
    {
        self.mutex.safeExecute { self.value = value }
    }

    public func getAndSet(_ newValue: Int) -> Int
    {
        var value = 0

        self.mutex.safeExecute {
            value = self.value
            self.value = newValue
        }

        return value
    }

    public func compareAndSet(_ excepted: Int, _ newValue: Int) -> Bool
    {
        var done = false

        self.mutex.safeExecute {
            if self.value == excepted
            {
                self.value = newValue
                done = true
            }
        }

        return done
    }

    public func incrementAndGet() -> Int
    {
        var value = 0

        self.mutex.safeExecute {
            self.value += 1
            value = self.value
        }

        return value
    }

    public func getAndIncrement() -> Int
    {
        var value = 0

        self.mutex.safeExecute {
            value = self.value
            self.value += 1
        }

        return value
    }

    public func decrementAndGet() -> Int
    {
        var value = 0

        self.mutex.safeExecute {
            self.value -= 1
            value = self.value
        }

        return value
    }

    public func getAndDecrement() -> Int
    {
        var value = 0

        self.mutex.safeExecute {
            value = self.value
            self.value -= 1
        }

        return value
    }
}
