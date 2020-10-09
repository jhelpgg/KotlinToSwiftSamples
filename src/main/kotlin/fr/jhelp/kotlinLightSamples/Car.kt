package fr.jhelp.kotlinLightSamples

class Car : Vehicule, Comparable<Car>
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

    override fun compareTo(other: Car): Int
    {
        val comparison = this.year - other.year

        if (comparison != 0)
        {
            return comparison
        }

        return this.model.compareTo(other.model)
    }

    override fun toString(): String
    {
        return "My super car : ${this.model} on ${this.year}"
    }
}