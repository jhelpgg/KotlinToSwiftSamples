
public class ToString : CustomStringConvertible {

     public var description: String { return self.toString() }


    public func toString() -> String
    {
        return "Super to string test!"
    }
}
