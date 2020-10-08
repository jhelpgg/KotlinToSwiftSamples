
public class Car : Vehicule
, Equatable {
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
}
