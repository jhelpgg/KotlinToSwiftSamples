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

    override fun equals(other: Any?): Boolean
    {
        if (null == other || other !is Car)
        {
            return false
        }

        val otherCar = other!! as Car
        return this.model == otherCar.model && this.year == otherCar.year
    }
}