package fr.jhelp.kotlinLightSamples

open class Vehicule
{
    val year : Int

    constructor(year:Int)
    {
        this.year = year
    }

    constructor()
    {
        this.year = 2020
    }
}