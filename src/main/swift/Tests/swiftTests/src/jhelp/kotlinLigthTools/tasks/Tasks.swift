

import Foundation

public func launchTask(_ task: @escaping  () -> Void)
{
    DispatchQueue.global().async(execute : task)
}

public func delayTask(_ delayMilliseconds: Int, _ task: @escaping  () -> Void)
{
    DispatchQueue.global().asyncAfter(deadline : DispatchTime.now()
                                                 + DispatchTimeInterval.milliseconds(delayMilliseconds),
                                      execute : task)
}
