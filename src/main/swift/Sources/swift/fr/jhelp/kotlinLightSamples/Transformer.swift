
protocol Transformer {
     associatedtype Transformer_S
     associatedtype Transformer_D

    func transform(_ source: Transformer_S) -> Transformer_D
}
