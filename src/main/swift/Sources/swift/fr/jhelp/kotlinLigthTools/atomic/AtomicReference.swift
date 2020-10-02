

class AtomicReference<T> {

    private let mutex: Mutex
    private var value: T?

    init(_ value: T?){
        self.mutex = Mutex()
        self.value = value
    }

    func get() -> T?
    {
        var value: T? = nil
        self.mutex.safeExecute { value = self.value }
        return value
    }

    func set(_ value: T?)
    {
        self.mutex.safeExecute { self.value = value }
    }

    func getAndSet(_ newValue: T?) -> T?
    {
        var value: T? = nil

        self.mutex.safeExecute {
            value = self.value
            self.value = newValue
        }

        return value
    }
}
