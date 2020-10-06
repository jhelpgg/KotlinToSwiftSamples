
public class IntToString : Transformer {
     public typealias Transformer_S = Int
     public typealias Transformer_D = String

    public func transform(_ source: Int) -> String
    {
        return "\(source)"
    }
}
