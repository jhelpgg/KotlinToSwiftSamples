
public class IntToString : Transformer {
     typealias Transformer_S = Int
     typealias Transformer_D = String

    public func transform(_ source: Int) -> String
    {
        return "\(source)"
    }
}
