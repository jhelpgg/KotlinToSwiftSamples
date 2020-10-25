
public class Element<T> {

    private let element: T
    private var next: Element<T>?

    public init(_ element: T){
        self.element = element
        self.next = nil
    }

    public func getElement() -> T
    {
        return self.element
    }

    public func getNext() -> Element<T>?
    {
        return self.next
    }

    public func setNext(_ element: T)
    {
        self.next = Element(element)
    }
}
