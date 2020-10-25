
private func partToHexadecimal(_ part: Int) -> String
{
    if part >= 0 && part <= 9
    {
        return "\(part)"
    }

    switch part
    {
        case 0xA  :  return "A"
        case 0xB  :  return "B"
        case 0xC  :  return "C"
        case 0xD  :  return "D"
        case 0xE  :  return "E"
        case 0xF  :  return "F"
        default  :  return "?"
    }
}

public func toHexadecimal(_ value: Int, _ minimumSize: Int) -> String
{
    var result = ""
    var started = false
    var shift = 28
    var part = 0

    while shift >= 0
    {
        part = (value >> shift) & 0xF

        if part > 0 || started
        {
            started = true
            result = "\(result)\(partToHexadecimal(part))"
        }

        shift -= 4
    }

    while result.length < minimumSize
    {
        result = "0\(result)"
    }

    return result
}

public func toHexadecimal(_ value: Long, _ minimumSize: Int) -> String
{
    var result = ""
    var started = false
    var shift = 60
    var part = 0

    while shift >= 0
    {
        part = ((value >> shift) & 0xF).toInt()

        if part > 0 || started
        {
            started = true
            result = "\(result)\(partToHexadecimal(part))"
        }

        shift -= 4
    }

    while result.length < minimumSize
    {
        result = "0\(result)"
    }

    return result
}

public func toHexadecimal(_ value: Int) -> String
{
    return toHexadecimal(value, 1)
}

public func toHexadecimal(_ value: Long) -> String
{
    return toHexadecimal(value, 1)
}

public func formHexadecimal(_ hexadecimal: String) -> Int
{
    var step = 0
    var value = 0

    for character in hexadecimal
    {
        switch character
        {
            case "0"  :  value = (value << 4) + 0
            case "1"  :  value = (value << 4) + 1
            case "2"  :  value = (value << 4) + 2
            case "3"  :  value = (value << 4) + 3
            case "4"  :  value = (value << 4) + 4
            case "5"  :  value = (value << 4) + 5
            case "6"  :  value = (value << 4) + 6
            case "7"  :  value = (value << 4) + 7
            case "8"  :  value = (value << 4) + 8
            case "9"  :  value = (value << 4) + 9
            case "a"  :  value = (value << 4) + 0xA
            case "A"  :  value = (value << 4) + 0xA
            case "b"  :  value = (value << 4) + 0xB
            case "B"  :  value = (value << 4) + 0xB
            case "c"  :  value = (value << 4) + 0xC
            case "C"  :  value = (value << 4) + 0xC
            case "d"  :  value = (value << 4) + 0xD
            case "D"  :  value = (value << 4) + 0xD
            case "e"  :  value = (value << 4) + 0xE
            case "E"  :  value = (value << 4) + 0xE
            case "f"  :  value = (value << 4) + 0xF
            case "F"  :  value = (value << 4) + 0xF
            default  :  return -1
        }

        step += 1
    }

    if step == 8
    {
        return (value.toLong() - 0x100000000).toInt()
    }

    return value
}
