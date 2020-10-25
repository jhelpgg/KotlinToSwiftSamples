package fr.jhelp.kotlinLigthTools

private fun partToHexadecimal(part: Int): String
{
    if (part >= 0 && part <= 9)
    {
        return "$part"
    }

    when (part)
    {
        0xA -> return "A"
        0xB -> return "B"
        0xC -> return "C"
        0xD -> return "D"
        0xE -> return "E"
        0xF -> return "F"
        else -> return "?"
    }
}

fun toHexadecimal(value: Int, minimumSize: Int): String
{
    var result = ""
    var started = false
    var shift = 28
    var part = 0

    while (shift >= 0)
    {
        part = (value shr shift) and 0xF

        if (part > 0 || started)
        {
            started = true
            result = "${result}${partToHexadecimal(part)}"
        }

        shift -= 4
    }

    while (result.length < minimumSize)
    {
        result = "0$result"
    }

    return result
}

fun toHexadecimal(value: Long, minimumSize: Int): String
{
    var result = ""
    var started = false
    var shift = 60
    var part = 0

    while (shift >= 0)
    {
        part = ((value shr shift) and 0xF).toInt()

        if (part > 0 || started)
        {
            started = true
            result = "${result}${partToHexadecimal(part)}"
        }

        shift -= 4
    }

    while (result.length < minimumSize)
    {
        result = "0$result"
    }

    return result
}

fun toHexadecimal(value: Int): String
{
    return toHexadecimal(value, 1)
}

fun toHexadecimal(value: Long): String
{
    return toHexadecimal(value, 1)
}

fun formHexadecimal(hexadecimal: String): Int
{
    var step = 0
    var value = 0

    for (character in hexadecimal)
    {
        when (character)
        {
            '0' -> value = (value shl 4) + 0
            '1' -> value = (value shl 4) + 1
            '2' -> value = (value shl 4) + 2
            '3' -> value = (value shl 4) + 3
            '4' -> value = (value shl 4) + 4
            '5' -> value = (value shl 4) + 5
            '6' -> value = (value shl 4) + 6
            '7' -> value = (value shl 4) + 7
            '8' -> value = (value shl 4) + 8
            '9' -> value = (value shl 4) + 9
            'a' -> value = (value shl 4) + 0xA
            'A' -> value = (value shl 4) + 0xA
            'b' -> value = (value shl 4) + 0xB
            'B' -> value = (value shl 4) + 0xB
            'c' -> value = (value shl 4) + 0xC
            'C' -> value = (value shl 4) + 0xC
            'd' -> value = (value shl 4) + 0xD
            'D' -> value = (value shl 4) + 0xD
            'e' -> value = (value shl 4) + 0xE
            'E' -> value = (value shl 4) + 0xE
            'f' -> value = (value shl 4) + 0xF
            'F' -> value = (value shl 4) + 0xF
            else -> return -1
        }

        step++
    }

    if (step == 8)
    {
        return (value.toLong() - 0x100000000).toInt()
    }

    return value
}