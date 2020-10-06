
public class Car : Vehicule {

    let model: String

    public init(_ model: String, _ year: Int){
    
        self.model = model
    super.init(year)
     }

    public init(_ model: String){
    
        self.model = model
    super.init()
     }
}
