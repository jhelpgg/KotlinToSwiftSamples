
func unwrap <T>(_ future: Future<Future<T>>) -> Future<T>
{
    let promise = Promise<T>()

    future.then { futureCombined in 
        switch futureCombined.status()
        {
            case FutureStatus.SUCCEED  :  promise.result(futureCombined.getResult()!.getResult()!)
            case FutureStatus.FAILED  :  promise.error(future.getError())
            case FutureStatus.CANCELED  :  promise.getFuture().cancel(future.getCancelReason()!)
            default                   : 
            do {
            }
        }
    }

    return promise.getFuture()
}

func futureValue <T>(_ value:T) -> Future<T>
{
    let promise = Promise<T>()
    promise.result(value)
    return promise.getFuture()
}

func futureFailed <T>(_ error:String) -> Future<T>
{
    let promise = Promise<T>()
    promise.error(error)
    return promise.getFuture()
}
