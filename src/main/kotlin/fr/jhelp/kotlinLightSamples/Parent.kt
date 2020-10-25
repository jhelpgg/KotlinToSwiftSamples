package fr.jhelp.kotlinLightSamples

open class Parent
{
    val value: Int
    var compute: Int

    constructor(value: Int)
    {
        this.value = value
        this.compute = 0
    }
}