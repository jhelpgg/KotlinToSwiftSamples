
public class ComparableTest : Comparable {

     static public func == (lhs: ComparableTest, rhs: ComparableTest) -> Bool
     {
          return lhs.compareTo(rhs) == 0
     }


     static public func < (lhs: ComparableTest, rhs: ComparableTest) -> Bool
     {
          return lhs.compareTo(rhs) < 0
     }


    let string: String
    let number: Int

    public init(_ string: String, _ number: Int){
        self.string = string
        self.number = number
    }

    public func compareTo(_ other: ComparableTest) -> Int
    {
        let comparison = self.string.compareTo(other.string)

        if comparison != 0
        {
            return comparison
        }

        return self.number - other.number
    }
}
