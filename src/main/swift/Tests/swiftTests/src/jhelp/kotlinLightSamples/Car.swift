
public class Car : Vehicule, Comparable
, Equatable , CustomStringConvertible {
     public var description: String { return self.toString() }


     static public func < (lhs: Car, rhs: Car) -> Bool
     {
          return lhs.compareTo(rhs) < 0
     }


     static public func == (lhs: Car, rhs: Car) -> Bool
     {
          return lhs.equals(rhs)
     }


    let model: String

    public init(_ model: String, _ year: Int){
    
        self.model = model
    super.init(year)
     }

    public init(_ model: String){
    
        self.model = model
    super.init()
     }

    public func equals(_ other: Any?) -> Bool
    {
        if nil == other || !(other is Car)
        {
            return false
        }

        let otherCar = other as! Car
        return self.model == otherCar.model && self.year == otherCar.year
    }

    public func compareTo(_ other: Car) -> Int
    {
        let comparison = self.year - other.year

        if comparison != 0
        {
            return comparison
        }

        return self.model.compareTo(other.model)
    }

    public func toString() -> String
    {
        return "My super car : \(self.model) on \(self.year)"
    }
}
