package fr.jhelp.kotlinLightSamples

class ComparableTest : Comparable<ComparableTest>
{
    val string: String
    val number: Int

    constructor(string: String, number: Int)
    {
        this.string = string
        this.number = number
    }

    override fun compareTo(other: ComparableTest): Int
    {
        val comparison = this.string.compareTo(other.string)

        if (comparison != 0)
        {
            return comparison
        }

        return this.number - other.number
    }
}