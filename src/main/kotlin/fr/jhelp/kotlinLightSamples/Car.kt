package fr.jhelp.kotlinLightSamples

class Car : Vehicule
{
    val model: String

    constructor(model: String, year: Int) : super(year)
    {
        this.model = model
    }

    constructor(model: String) : super()
    {
        this.model = model
    }
}