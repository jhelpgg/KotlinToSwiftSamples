

public class AtomicReference<T> {

    private let mutex: Mutex
    private var value: T?

    public init(_ value: T?){
        self.mutex = Mutex()
        self.value = value
    }

    public func get() -> T?
    {
        var value: T? = nil
        self.mutex.safeExecute { value = self.value }
        return value
    }

    public func set(_ value: T?)
    {
        self.mutex.safeExecute { self.value = value }
    }

    public func getAndSet(_ newValue: T?) -> T?
    {
        var value: T? = nil

        self.mutex.safeExecute {
            value = self.value
            self.value = newValue
        }

        return value
    }
}
