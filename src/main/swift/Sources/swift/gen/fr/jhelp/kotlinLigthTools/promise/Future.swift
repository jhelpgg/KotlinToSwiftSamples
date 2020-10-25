

public class Future<T> {

    private let promise: Promise<T>
    private let futureStatus: AtomicReference<FutureStatus>
    private let mutex: Mutex
    private var result: T?
    private var error: String
    private var continuations: Array<() -> Void>

    internal init(_ promise: Promise<T>){
        self.promise = promise
        self.futureStatus = AtomicReference<FutureStatus>(FutureStatus.COMPUTING)
        self.mutex = Mutex()
        self.result = nil
        self.error = ""
        self.continuations = Array<() -> Void>()
    }

    public func status() -> FutureStatus
    {
        return self.futureStatus.get()!
    }

    public func getResult() -> T?
    {
        return self.result
    }

    public func getError() -> String
    {
        return self.error
    }

    public func getCancelReason() -> String?
    {
        return self.promise.getCancelReason()
    }

    public func cancel(_ reason: String)
    {
        if self.futureStatus.get() == FutureStatus.COMPUTING
        {
            self.futureStatus.set(FutureStatus.CANCELED)
            self.promise.cancel(reason)
            self.fireListeners()
        }
    }

    public func andThen <T1>(_ continuation: @escaping  (T) -> T1) -> Future<T1>
    {
        let promise = Promise<T1>()
        let action: () -> Void = {
            switch self.futureStatus.get()!
            {
                case FutureStatus.SUCCEED  : 
                do {
                    do
                    {
                        try promise.result(continuation(self.result!))
                    }
                    catch
                    {
                        promise.error("Failed to execute continuation : \(error)")
                    }
                }
                case FutureStatus.FAILED  :  promise.error(self.error)
                case FutureStatus.CANCELED  :  promise.getFuture().cancel(self.getCancelReason()!)
                default                   : 
                do {
                }

            }
        }

        self.mutex.safeExecute {
            switch self.futureStatus.get()!
            {
                case FutureStatus.COMPUTING  :  self.continuations.append(action)
                default                    :  launchTask(action)
            }
        }

        return promise.getFuture()
    }

    public func then <T1>(_ continuation: @escaping  (Future<T>) -> T1) -> Future<T1>
    {
        let promise = Promise<T1>()
        let action: () -> Void = {
            do
            {
                try promise.result(continuation(self))
            }
            catch
            {
                promise.error("Failed to execute continuation : \(error)")
            }
        }

        self.mutex.safeExecute {
            switch self.futureStatus.get()!
            {
                case FutureStatus.COMPUTING  :  self.continuations.append(action)
                default                    :  launchTask(action)
            }
        }

        return promise.getFuture()
    }

    public func andThenUnwrap <T1>(_ continuation: @escaping  (T) -> Future<T1>) -> Future<T1>
    {
        return unwrap(self.andThen(continuation))
    }

    public func thenUnwrap <T1>(_ continuation: @escaping  (Future<T>) -> Future<T1>) -> Future<T1>
    {
        return unwrap(self.then(continuation))
    }

    internal func result(_ result: T)
    {
        if self.futureStatus.get() == FutureStatus.COMPUTING
        {
            self.futureStatus.set(FutureStatus.SUCCEED)
            self.result = result
            self.fireListeners()
        }
    }

    internal func error(_ cause: String)
    {
        if self.futureStatus.get() == FutureStatus.COMPUTING
        {
            self.futureStatus.set(FutureStatus.FAILED)
            self.error = cause
            self.fireListeners()
        }
    }

    private func fireListeners()
    {
        self.mutex.safeExecute {
            for continuation in self.continuations
            {
                launchTask(continuation)
            }

            self.continuations.removeAll()
        }
    }
}
