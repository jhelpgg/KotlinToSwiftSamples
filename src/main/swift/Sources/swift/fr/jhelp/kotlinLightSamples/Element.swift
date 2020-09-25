
class Element<T> {

    private let element: T
    private var next: Element<T>?

    init(_ element: T){
        self.element = element
        self.next = nil
    }

    func getElement() -> T
    {
        return self.element
    }

    func getNext() -> Element<T>?
    {
        return self.next
    }

    func setNext(_ element: T)
    {
        self.next = Element(element)
    }
}
