package fr.jhelp.kotlinLightSamples

class CompanionTest
{
    companion object
    {
        /**
         * Wonderful world }}}}
         */
        fun staticMethod()
        {
            val k = '}'
            println("static {{{{{ $k")
        }

        // ploki { {{{{
    }

    fun instanceMethod()
    {
        val l = '\n'
        val m = '\u00af'
        println("instance $l hh $m pp")
    }
}