package fr.jhelp.kotlinLightSamples

class CompanionTest
{
    companion object
    {
        var before = "before"

        /**
         * Wonderful world }}}}
         */
        fun staticMethod()
        {
            val k = '}'
            println("static {{{{{ $k")
        }

        // ploki { {{{{

        val after = "after"
    }

    fun instanceMethod()
    {
        val l = '\n'
        val m = '\u00af'
        println("instance $l hh $m pp")
    }
}