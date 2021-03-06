

class Queue<T> {

    private var head: Element<T>?
    private var tail: Element<T>?

    init(){
        self.head = nil
        self.tail = nil
    }

    func isEmpty() -> Bool
    {
        return self.head == nil
    }

    func enqueue(_ element: T)
    {
        if self.head == nil
        {
            self.head = Element(element)
            self.tail = self.head
            return
        }

        self.tail!.setNext(element)
        self.tail = self.tail!.getNext()
    }

    func dequeue() throws  -> T
    {
        guard (self.head != nil) else  { throw CommonManagedExceptions.IllegalStateException("Queue is empty") }

        let element = self.head!.getElement()
        self.head = self.head!.getNext()

        if self.head == nil
        {
            self.tail = nil
        }

        return element
    }
}
