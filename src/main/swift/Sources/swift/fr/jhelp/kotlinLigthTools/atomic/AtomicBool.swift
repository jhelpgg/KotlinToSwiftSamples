

class AtomicBool {

    private let mutex: Mutex
    private var value: Bool

    init(_ value: Bool){
        self.mutex = Mutex()
        self.value = value
    }

    func get() -> Bool
    {
        var value = false
        self.mutex.safeExecute { value = self.value }
        return value
    }

    func set(_ value: Bool)
    {
        self.mutex.safeExecute { self.value = value }
    }

    func getAndSet(_ newValue: Bool) -> Bool
    {
        var value = false

        self.mutex.safeExecute {
            value = self.value
            self.value = newValue
        }

        return value
    }

    func compareAndSet(_ excepted: Bool, _ newValue: Bool) -> Bool
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
}
