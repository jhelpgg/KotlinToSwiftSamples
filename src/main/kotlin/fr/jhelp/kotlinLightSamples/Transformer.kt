package fr.jhelp.kotlinLightSamples

interface Transformer<S, D>
{
    fun transform(source: S): D
}