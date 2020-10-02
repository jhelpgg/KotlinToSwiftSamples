

class AtomicInt {

    private let mutex: Mutex
    private var value: Int

    init(_ value: Int){
        self.mutex = Mutex()
        self.value = value
    }

    func get() -> Int
    {
        var value = 0
        self.mutex.safeExecute { value = self.value }
        return value
    }

    func set(_ value: Int)
    {
        self.mutex.safeExecute { self.value = value }
    }

    func getAndSet(_ newValue: Int) -> Int
    {
        var value = 0

        self.mutex.safeExecute {
            value = self.value
            self.value = newValue
        }

        return value
    }

    func compareAndSet(_ excepted: Int, _ newValue: Int) -> Bool
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

    func incrementAndGet() -> Int
    {
        var value = 0

        self.mutex.safeExecute {
            self.value += 1
            value = self.value
        }

        return value
    }

    func getAndIncrement() -> Int
    {
        var value = 0

        self.mutex.safeExecute {
            value = self.value
            self.value += 1
        }

        return value
    }

    func decrementAndGet() -> Int
    {
        var value = 0

        self.mutex.safeExecute {
            self.value -= 1
            value = self.value
        }

        return value
    }

    func getAndDecrement() -> Int
    {
        var value = 0

        self.mutex.safeExecute {
            value = self.value
            self.value -= 1
        }

        return value
    }
}
