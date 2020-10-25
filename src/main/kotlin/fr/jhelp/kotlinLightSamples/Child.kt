package fr.jhelp.kotlinLightSamples

import fr.jhelp.kotlinLight.Super

class Child : Parent
{
    val number: Int

    constructor(value: Int, number: Int) : super(value)
    {
        this.number = number
        @Super
        this.compute = number + value
    }
}