import Foundation

public class ByteStream
{
    private var data : Array<Byte>
    private var index : Int
    private let bigEndian : Bool

    init(_ data : Array<Byte>, _ bigEndian:Bool)
    {
        self.bigEndian = bigEndian
        self.data = data
        self.index = 0
    }

    func remaining() -> Int
    {
        return self.data.count - self.index
    }

    func getPosition() -> Int
    {
        return self.index
    }

    func setPosition(_ index:Int)
    {
        self.index = index
    }

    func rewind()
    {
        self.index = 0
    }

    func readInt8() -> Int
    {
        let data = self.readData(1)
        return Int(data.withUnsafeBytes { $0.load(fromByteOffset: 0, as: UInt8.self) })
    }

    func readInt16() -> Int
    {
        print("readInt16 step 1/4")
        let data = self.readData(2)
        print("readInt16 step 2/4")
        let int16 : UInt16 = data.withUnsafeBytes { $0.load(fromByteOffset: 0, as: UInt16.self) }
        print("readInt16 step 3/4 : int16 = \(int16)")
        let result : Int = Int(int16)
        print("readInt16 step 4/4 : result = \(result)")
        return result
    }

    func readInt32() -> Int
    {
        let data = self.readData(4)
        return Int(data.withUnsafeBytes { $0.load(fromByteOffset: 0, as: Int32.self) })
    }

    func readInt64() -> Long
    {
        let data = self.readData(8)
        return Long(data.withUnsafeBytes { $0.load(fromByteOffset: 0, as: Int64.self) })
    }

    func readFloat() -> Float
    {
        let data = self.readData(4)
        return data.withUnsafeBytes { $0.load(fromByteOffset: 0, as: Float.self) }
    }

    func readDouble() -> Double
    {
        let data = self.readData(8)
        return data.withUnsafeBytes { $0.load(fromByteOffset: 0, as: Double.self) }
    }

    private func readData(_ number:Int) -> Data
    {
        var array = [UInt8]()
        let max = self.index + number
        var byte : Byte

        while self.index < max
        {
            byte = self.data[self.index]

            if self.bigEndian
            {
                array.insert(UInt8(byte), at: 0)
            }
            else
            {
                array.append(UInt8(byte))
            }

            self.index += 1
        }

        var data = Data()
        data.append(contentsOf: array)
        return data
    }
}
