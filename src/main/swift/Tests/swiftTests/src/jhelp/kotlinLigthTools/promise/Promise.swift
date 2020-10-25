

public class Promise<T> {

    private var future: Future<T>?
    private let cancelReason: AtomicReference<String>
    private var listeners: Array<(String) -> Void>
    private let mutex: Mutex
    private let complete: AtomicBool

    public init(){
        self.future = nil
        self.cancelReason = AtomicReference<String>(nil)
        self.listeners = Array<(String) -> Void>()
        self.mutex = Mutex()
        self.complete = AtomicBool(false)
    }

    public func getFuture() -> Future<T>
    {
        self.mutex.safeExecute {
            if self.future == nil
            {
                self.future = Future<T>(self)
            }
        }

        return self.future!
    }

    public func canceled() -> Bool
    {
        return self.cancelReason.get() != nil
    }

    public func getCancelReason() -> String?
    {
        return self.cancelReason.get()
    }

    public func register(_ cancelListener: @escaping  (String) -> Void)
    {
        self.mutex.safeExecute {
            let cancelReason = self.cancelReason.get()

            if cancelReason != nil
            {
                launchTask { cancelListener(cancelReason!) }
            }
            else
            {
                self.listeners.append(cancelListener)
            }
        }
    }

    public func result(_ result: T)
    {
        if self.complete.compareAndSet(false, true)
        {
            self.mutex.safeExecute { self.listeners.removeAll() }
            self.getFuture().result(result)
        }
    }

    public func error(_ cause: String)
    {
        if self.complete.compareAndSet(false, true)
        {
            self.mutex.safeExecute { self.listeners.removeAll() }
            self.getFuture().error(cause)
        }
    }

    internal func cancel(_ reason: String)
    {
        if self.complete.compareAndSet(false, true)
        {
            if self.cancelReason.get() == nil
            {
                self.cancelReason.set(reason)
                self.complete.set(true)

                for listener in self.listeners
                {
                    launchTask { listener(reason) }
                }

                self.listeners.removeAll()
            }
        }
    }
}
