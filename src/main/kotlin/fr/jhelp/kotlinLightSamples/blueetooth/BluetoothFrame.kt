package fr.jhelp.kotlinLightSamples.blueetooth

import fr.jhelp.kotlinLight.ByteStream
import fr.jhelp.kotlinLight.CommonList

class BluetoothFrame
{
    companion object
    {
        fun mergeUInt16(highPart: Int, lowPart: Int): Int
        {
            return ((highPart and 0xFFFF) shl 16) or (lowPart and 0xFFFF)
        }

        fun getBits(input: Int, offset: Int, length: Int): Int
        {
            return (input shr offset) and ((1 shl length) - 1)
        }
    }

    private val byteStream: ByteStream

    constructor(byteArray: CommonList<Byte>)
    {
        this.byteStream = ByteStream(byteArray, false)
    }

    fun getTimestamp(): Long
    {
        return this.byteStream.readInt32().toLong() and 0xFFFFFFFFL
    }

    fun getUInt8(): Int
    {
        return this.byteStream.readInt8()
    }

    fun getUInt16(): Int
    {
        return this.byteStream.readInt16()
    }

    fun getUInt32(): Long
    {
        return this.byteStream.readInt32().toLong() and 0xFFFFFFFFL
    }

    fun getInt8(): Int
    {
        return this.byteStream.readInt8().toByte().toInt()
    }

    fun getInt16(): Int
    {
        var value = this.byteStream.readInt16()

        if ( (value and 0x8000) != 0)
        {
            value -= 0x10000
        }

        return value
    }

    fun getInt32(): Int
    {
        return this.byteStream.readInt32()
    }

    fun getFloat(): Float
    {
        return this.byteStream.readFloat()
    }

    fun position(position: Int): BluetoothFrame
    {
        this.byteStream.setPosition(position)
        return this
    }

    fun remaining(): Int
    {
        return this.byteStream.remaining()
    }

    fun rewind(): BluetoothFrame
    {
        this.byteStream.rewind()
        return this
    }
}