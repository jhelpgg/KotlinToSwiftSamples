package fr.jhelp.kotlinLightSamples

class EqualsTest
{
    val info: String

    constructor(info: String)
    {
        this.info = info
    }

    override fun equals(other: Any?): Boolean
    {
        if (null == other || (other !is EqualsTest))
        {
            return false
        }

        val otherEquals = other!! as EqualsTest
        return this.info == otherEquals.info
    }
}