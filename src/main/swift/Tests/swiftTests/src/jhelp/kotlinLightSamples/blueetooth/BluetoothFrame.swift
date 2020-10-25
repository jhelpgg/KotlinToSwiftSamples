

public class BluetoothFrame {

    
        public static func mergeUInt16(_ highPart: Int, _ lowPart: Int) -> Int
        {
            return ((highPart & 0xFFFF) << 16) | (lowPart & 0xFFFF)
        }

        public static func getBits(_ input: Int, _ offset: Int, _ length: Int) -> Int
        {
            return (input >> offset) & ((1 << length) - 1)
        }
    

    private let byteStream: ByteStream

    public init(_ byteArray: Array<Byte>){
        self.byteStream = ByteStream(byteArray, false)
    }

    public func getTimestamp() -> Long
    {
        return self.byteStream.readInt32().toLong() & Long(0xFFFFFFFF)
    }

    public func getUInt8() -> Int
    {
        return self.byteStream.readInt8()
    }

    public func getUInt16() -> Int
    {
        return self.byteStream.readInt16()
    }

    public func getUInt32() -> Long
    {
        return self.byteStream.readInt32().toLong() & Long(0xFFFFFFFF)
    }

    public func getInt8() -> Int
    {
        return self.byteStream.readInt8().toByte().toInt()
    }

    public func getInt16() -> Int
    {
        var value = self.byteStream.readInt16()

        if  (value & 0x8000) != 0
        {
            value -= 0x10000
        }

        return value
    }

    public func getInt32() -> Int
    {
        return self.byteStream.readInt32()
    }

    public func getFloat() -> Float
    {
        return self.byteStream.readFloat()
    }

    public func position(_ position: Int) -> BluetoothFrame
    {
        self.byteStream.setPosition(position)
        return self
    }

    public func remaining() -> Int
    {
        return self.byteStream.remaining()
    }

    public func rewind() -> BluetoothFrame
    {
        self.byteStream.rewind()
        return self
    }
}
