

import Foundation

public class ByteStreamReader {

    private let data: Array<Byte>
    private let bigEndian: Bool
    private var position: Int

    public init(_ data: Array<Byte>, _ bigEndian: Bool){
        self.data = data
        self.bigEndian = bigEndian
        self.position = 0
    }

    public func getPosition() -> Int
    {
        return self.position
    }

    public func setPosition(_ position: Int) throws 
    {
        guard (position >= 0 && position < self.data.count) else  { throw IllegalArgumentException("position must be in [0, \(self.data.count)[ not \(position)") }
        self.position = position
    }

    public func getSize() -> Int
    {
        return self.data.count
    }

    public func remaining() -> Int
    {
        return self.data.count - self.position
    }

    public func rewind()
    {
        self.position = 0
    }

    public func readInt8() throws  -> Int
    {
        try self.checkEnoughData(1)
        let value = self.data[self.position].toInt()
        self.position += 1
        return value
    }

    public func readUInt8() throws  -> Int
    {
        return try self.readInt8() & 0xFF
    }

    public func readInt16() throws  -> Int
    {
        try self.checkEnoughData(2)
        let byte1 = self.data[self.position].toInt()
        let byte2 = self.data[self.position + 1].toInt()
        self.position += 2

        if self.bigEndian
        {
            return (byte1 << 8) | (byte2 & 0xFF)
        }

        return (byte2 << 8) | (byte1 & 0xFF)
    }

    public func readUInt16() throws  -> Int
    {
        try self.checkEnoughData(2)
        let byte1 = self.data[self.position].toInt()
        let byte2 = self.data[self.position + 1].toInt()
        self.position += 2

        if self.bigEndian
        {
            return ((byte1 & 0xFF) << 8) | (byte2 & 0xFF)
        }

        return ((byte2 & 0xFF) << 8) | (byte1 & 0xFF)
    }

    public func readInt32() throws  -> Int
    {
        try self.checkEnoughData(4)
        let byte1 = self.data[self.position].toInt()
        let byte2 = self.data[self.position + 1].toInt()
        let byte3 = self.data[self.position + 2].toInt()
        let byte4 = self.data[self.position + 3].toInt()
        self.position += 4

        if self.bigEndian
        {
            var result = byte1 << 24
            result = result | ((byte2 & 0xFF) << 16)
            result = result | ((byte3 & 0xFF) << 8)
            return result | (byte4 & 0xFF)
        }

        var result = byte4 << 24
        result = result | ((byte3 & 0xFF) << 16)
        result = result | ((byte2 & 0xFF) << 8)
        return result | (byte1 & 0xFF)
    }

    public func readUInt32() throws  -> Long
    {
        try self.checkEnoughData(4)
        let byte1 = self.data[self.position].toLong()
        let byte2 = self.data[self.position + 1].toLong()
        let byte3 = self.data[self.position + 2].toLong()
        let byte4 = self.data[self.position + 3].toLong()
        self.position += 4

        if self.bigEndian
        {
            var result = (byte1 & 0xFF) << 24
            result = result | ((byte2 & 0xFF) << 16)
            result = result | ((byte3 & 0xFF) << 8)
            return result | (byte4 & 0xFF)
        }

        var result = (byte4 & 0xFF) << 24
        result = result | ((byte3 & 0xFF) << 16)
        result = result | ((byte2 & 0xFF) << 8)
        return result | (byte1 & 0xFF)
    }

    /*

     * <p>If the argument is {@code 0x7f800000}, the result is positive
     * infinity.
     *
     * <p>If the argument is {@code 0xff800000}, the result is negative
     * infinity.


     * <p>If the argument is any value in the range
     * {@code 0x7f800001} through {@code 0x7fffffff} or in
     * the range {@code 0xff800001} through
     * {@code 0xffffffff}, the result is a NaN.

      <blockquote><pre>{@code
     * int s = ((bits >> 31) == 0) ? 1 : -1;
     * int e = ((bits >> 23) & 0xff);
     * int m = (e == 0) ?
     *                 (bits & 0x7fffff) << 1 :
     *                 (bits & 0x7fffff) | 0x800000;
     * }</pre></blockquote>

     * Then the floating-point result equals the value of the mathematical
     * expression <i>s</i>&middot;<i>m</i>&middot;2<sup><i>e</i>-150</sup>.
                 e - 150
        s * m * 2
     */
    public func readFloat() throws  -> Float
    {
        try self.checkEnoughData(4)
        var byte1 = 0
        var byte2 = 0
        var byte3 = 0
        var byte4 = 0

        if self.bigEndian
        {
            byte1 = self.data[self.position].toInt() & 0xFF
            byte2 = self.data[self.position + 1].toInt() & 0xFF
            byte3 = self.data[self.position + 2].toInt() & 0xFF
            byte4 = self.data[self.position + 3].toInt() & 0xFF
        }
        else
        {
            byte1 = self.data[self.position + 3].toInt() & 0xFF
            byte2 = self.data[self.position + 2].toInt() & 0xFF
            byte3 = self.data[self.position + 1].toInt() & 0xFF
            byte4 = self.data[self.position].toInt() & 0xFF
        }

        self.position += 4

        if (byte1 == 0x7F || byte1 == 0xFF) && byte2 >= 0x80
        {
            throw IllegalStateException("The data not represents a valid Float")
        }

        var sign = Float( 0)

        if byte1 >= 0x80
        {
            sign =  Float(-1)
        }
        else
        {
            sign = Float( 1)
        }

        let exponent = ((byte1 & 0x7F) << 1) | (byte2 >> 7)
        var mantis = 0

        if exponent == 0
        {
            mantis = (byte2 & 0x7F) << 16
            mantis = mantis | (byte3 << 8)
            mantis = mantis | byte4
            mantis = mantis << 1
        }
        else
        {
            mantis = (byte2 & 0x7F) << 16
            mantis = mantis | (byte3 << 8)
            mantis = mantis | byte4
            mantis = mantis | 0x800000
        }

        let power = pow(2.0, (exponent - 150).toDouble()).toFloat()
        return sign * mantis.toFloat() * power
    }

    private func checkEnoughData(_ number: Int) throws 
    {
        guard (self.position + number <= self.data.count) else  { throw IllegalStateException("Not enough data to read \(number) bytes") }
    }
}
