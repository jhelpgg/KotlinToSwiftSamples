

class AtomicLong {

    private let mutex: Mutex
    private var value: Long

    init(_ value: Long){
        self.mutex = Mutex()
        self.value = value
    }

    func get() -> Long
    {
        var value = Long(0)
        self.mutex.safeExecute { value = self.value }
        return value
    }

    func set(_ value: Long)
    {
        self.mutex.safeExecute { self.value = value }
    }

    func getAndSet(_ newValue: Long) -> Long
    {
        var value = Long(0)

        self.mutex.safeExecute {
            value = self.value
            self.value = newValue
        }

        return value
    }

    func compareAndSet(_ excepted: Long, _ newValue: Long) -> Bool
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

    func incrementAndGet() -> Long
    {
        var value = Long(0)

        self.mutex.safeExecute {
            self.value += 1
            value = self.value
        }

        return value
    }

    func getAndIncrement() -> Long
    {
        var value = Long(0)

        self.mutex.safeExecute {
            value = self.value
            self.value += 1
        }

        return value
    }

    func decrementAndGet() -> Long
    {
        var value = Long(0)

        self.mutex.safeExecute {
            self.value -= 1
            value = self.value
        }

        return value
    }

    func getAndDecrement() -> Long
    {
        var value = Long(0)

        self.mutex.safeExecute {
            value = self.value
            self.value -= 1
        }

        return value
    }
}
