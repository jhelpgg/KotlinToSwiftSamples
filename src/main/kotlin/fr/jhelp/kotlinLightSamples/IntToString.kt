package fr.jhelp.kotlinLightSamples

class IntToString : Transformer<Int, String>
{
    override fun transform(source: Int): String
    {
        return "$source"
    }
}