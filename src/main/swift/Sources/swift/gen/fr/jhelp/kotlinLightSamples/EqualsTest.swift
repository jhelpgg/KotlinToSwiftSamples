
public class EqualsTest : Equatable {

     static public func == (lhs: EqualsTest, rhs: EqualsTest) -> Bool
     {
          return lhs.equals(rhs)
     }


    let info: String

    public init(_ info: String){
        self.info = info
    }

    public func equals(_ other: Any?) -> Bool
    {
        if nil == other || !(other is EqualsTest)
        {
            return false
        }

        let otherEquals = other as! EqualsTest
        return self.info == otherEquals.info
    }
}
