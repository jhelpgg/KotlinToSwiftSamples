package fr.jhelp.kotlinLightSamples

import fr.jhelp.kotlinLight.ByteStream
import fr.jhelp.kotlinLight.CommonList

fun readInt8()
{
    var bytes = CommonList<Byte>()
    bytes.append(0.toByte())
    bytes.append(1.toByte())
    bytes.append(2.toByte())
    bytes.append(3.toByte())
    bytes.append(4.toByte())
    bytes.append(5.toByte())
    bytes.append(6.toByte())
    bytes.append(7.toByte())
    var stream = ByteStream(bytes, true)
    var data = stream.readInt8()
    println("data=$data")
    data = stream.readInt8()
    println("data=$data")
    data = stream.readInt8()
    println("data=$data")
    data = stream.readInt8()
    println("data=$data")
    data = stream.readInt8()
    println("data=$data")
    data = stream.readInt8()
    println("data=$data")
    data = stream.readInt8()
    println("data=$data")
    data = stream.readInt8()
    println("data=$data")
    println("************************")
    stream = ByteStream(bytes, false)
    data = stream.readInt8()
    println("data=$data")
    data = stream.readInt8()
    println("data=$data")
    data = stream.readInt8()
    println("data=$data")
    data = stream.readInt8()
    println("data=$data")
    data = stream.readInt8()
    println("data=$data")
    data = stream.readInt8()
    println("data=$data")
    data = stream.readInt8()
    println("data=$data")
    data = stream.readInt8()
    println("data=$data")
}

fun readInt16()
{
    var bytes = CommonList<Byte>()
    bytes.append(0.toByte())
    bytes.append(1.toByte())
    bytes.append(2.toByte())
    bytes.append(3.toByte())
    bytes.append(4.toByte())
    bytes.append(5.toByte())
    bytes.append(6.toByte())
    bytes.append(7.toByte())
    var stream = ByteStream(bytes, true)
    var data = stream.readInt16()
    println("data=$data")
    data = stream.readInt16()
    println("data=$data")
    data = stream.readInt16()
    println("data=$data")
    data = stream.readInt16()
    println("data=$data")
    println("************************")
    stream = ByteStream(bytes, false)
    data = stream.readInt16()
    println("data=$data")
    data = stream.readInt16()
    println("data=$data")
    data = stream.readInt16()
    println("data=$data")
    data = stream.readInt16()
    println("data=$data")
}

fun readInt32()
{
    var bytes = CommonList<Byte>()
    bytes.append(0.toByte())
    bytes.append(1.toByte())
    bytes.append(2.toByte())
    bytes.append(3.toByte())
    bytes.append(4.toByte())
    bytes.append(5.toByte())
    bytes.append(6.toByte())
    bytes.append(7.toByte())
    var stream = ByteStream(bytes, true)
    var data = stream.readInt32()
    println("data=$data")
    data = stream.readInt32()
    println("data=$data")
    println("************************")
    stream = ByteStream(bytes, false)
    data = stream.readInt32()
    println("data=$data")
    data = stream.readInt32()
    println("data=$data")
}

fun readInt64()
{
    var bytes = CommonList<Byte>()
    bytes.append(0.toByte())
    bytes.append(1.toByte())
    bytes.append(2.toByte())
    bytes.append(3.toByte())
    bytes.append(4.toByte())
    bytes.append(5.toByte())
    bytes.append(6.toByte())
    bytes.append(7.toByte())
    var stream = ByteStream(bytes, true)
    var data = stream.readInt64()
    println("data=$data")
    println("************************")
    stream = ByteStream(bytes, false)
    data = stream.readInt64()
    println("data=$data")
}

fun readFloat()
{
    var bytes = CommonList<Byte>()
    bytes.append(0.toByte())
    bytes.append(1.toByte())
    bytes.append(2.toByte())
    bytes.append(3.toByte())
    bytes.append(4.toByte())
    bytes.append(5.toByte())
    bytes.append(6.toByte())
    bytes.append(7.toByte())
    var stream = ByteStream(bytes, true)
    var data = stream.readFloat()
    println("data=$data")
    data = stream.readFloat()
    println("data=$data")
    println("************************")
    stream = ByteStream(bytes, false)
    data = stream.readFloat()
    println("data=$data")
    data = stream.readFloat()
    println("data=$data")
}

fun readDouble()
{
    var bytes = CommonList<Byte>()
    bytes.append(0.toByte())
    bytes.append(1.toByte())
    bytes.append(2.toByte())
    bytes.append(3.toByte())
    bytes.append(4.toByte())
    bytes.append(5.toByte())
    bytes.append(6.toByte())
    bytes.append(7.toByte())
    var stream = ByteStream(bytes, true)
    var data = stream.readDouble()
    println("data=$data")
    println("************************")
    stream = ByteStream(bytes, false)
    data = stream.readDouble()
    println("data=$data")
}