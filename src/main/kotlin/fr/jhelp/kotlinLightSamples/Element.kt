package fr.jhelp.kotlinLightSamples

class Element<T>
{
    private val element: T
    private var next: Element<T>?

    constructor(element: T)
    {
        this.element = element
        this.next = null
    }

    fun getElement(): T
    {
        return this.element
    }

    fun getNext(): Element<T>?
    {
        return this.next
    }

    fun setNext(element: T)
    {
        this.next = Element(element)
    }
}