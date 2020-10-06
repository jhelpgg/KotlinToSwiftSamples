package fr.jhelp.kotlinLightSamples

import fr.jhelp.kotlinLight.guard
import fr.jhelp.kotlinLigthTools.exceptions.IllegalStateException

class Queue<T>
{
    private var head: Element<T>?
    private var tail: Element<T>?

    constructor()
    {
        this.head = null
        this.tail = null
    }

    fun isEmpty(): Boolean
    {
        return this.head == null
    }

    fun enqueue(element: T)
    {
        if (this.head == null)
        {
            this.head = Element(element)
            this.tail = this.head
            return
        }

        this.tail!!.setNext(element)
        this.tail = this.tail!!.getNext()
    }

    @Throws
    fun dequeue(): T
    {
        (this.head != null).guard { throw IllegalStateException("Queue is empty") }

        val element = this.head!!.getElement()
        this.head = this.head!!.getNext()

        if (this.head == null)
        {
            this.tail = null
        }

        return element
    }
}