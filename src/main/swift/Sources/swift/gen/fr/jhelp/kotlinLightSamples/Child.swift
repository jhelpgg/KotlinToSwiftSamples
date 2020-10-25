

public class Child : Parent {

    let number: Int

    public init(_ value: Int, _ number: Int){
    
        self.number = number
        super.init(value)
        self.compute = number + value
    }
}
