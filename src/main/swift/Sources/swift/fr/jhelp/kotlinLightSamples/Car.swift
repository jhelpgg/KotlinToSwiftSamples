
class Car : Vehicule {

    let model: String

    init(_ model: String, _ year: Int){
    
        self.model = model
    super.init(year)
     }

    init(_ model: String){
    
        self.model = model
    super.init()
     }
}
