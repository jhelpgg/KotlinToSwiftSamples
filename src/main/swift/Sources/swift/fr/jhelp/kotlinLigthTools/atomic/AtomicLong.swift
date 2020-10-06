

public class AtomicLong {

    private let mutex: Mutex
    private var value: Long

    public init(_ value: Long){
        self.mutex = Mutex()
        self.value = value
    }

    public func get() -> Long
    {
        var value = Long(0)
        self.mutex.safeExecute { value = self.value }
        return value
    }

    public func set(_ value: Long)
    {
        self.mutex.safeExecute { self.value = value }
    }

    public func getAndSet(_ newValue: Long) -> Long
    {
        var value = Long(0)

        self.mutex.safeExecute {
            value = self.value
            self.value = newValue
        }

        return value
    }

    public func compareAndSet(_ excepted: Long, _ newValue: Long) -> Bool
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

    public func incrementAndGet() -> Long
    {
        var value = Long(0)

        self.mutex.safeExecute {
            self.value += 1
            value = self.value
        }

        return value
    }

    public func getAndIncrement() -> Long
    {
        var value = Long(0)

        self.mutex.safeExecute {
            value = self.value
            self.value += 1
        }

        return value
    }

    public func decrementAndGet() -> Long
    {
        var value = Long(0)

        self.mutex.safeExecute {
            self.value -= 1
            value = self.value
        }

        return value
    }

    public func getAndDecrement() -> Long
    {
        var value = Long(0)

        self.mutex.safeExecute {
            value = self.value
            self.value -= 1
        }

        return value
    }
}
