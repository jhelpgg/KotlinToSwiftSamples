


import XCTest


public class ByteStreamReaderTests : XCTestCase {

public func test_readInt8()
    {
        do
        {
            var data = Array<Byte>()
            data.append(1.toByte())
            data.append((-25).toByte())
            data.append(125.toByte())
            data.append((-125).toByte())
            let byteStreamReader = ByteStreamReader(data, true)
            var byte = try  byteStreamReader.readInt8()
            XCTAssertEqual(1, byte, "Objects are not equals")
            byte = try  byteStreamReader.readInt8()
            XCTAssertEqual(-25, byte, "Objects are not equals")
            byte = try  byteStreamReader.readInt8()
            XCTAssertEqual(125, byte, "Objects are not equals")
            byte = try  byteStreamReader.readInt8()
            XCTAssertEqual(-125, byte, "Objects are not equals")
        }
        catch
        {
            XCTFail("Read failed : \(error)")
        }
    }

public func test_readUInt8()
    {
        do
        {
            var data = Array<Byte>()
            data.append(1.toByte())
            data.append(128.toByte())
            data.append(135.toByte())
            data.append(254.toByte())
            let byteStreamReader = ByteStreamReader(data, true)
            var byte = try  byteStreamReader.readUInt8()
            XCTAssertEqual(1, byte, "Objects are not equals")
            byte = try  byteStreamReader.readUInt8()
            XCTAssertEqual(128, byte, "Objects are not equals")
            byte = try  byteStreamReader.readUInt8()
            XCTAssertEqual(135, byte, "Objects are not equals")
            byte = try  byteStreamReader.readUInt8()
            XCTAssertEqual(254, byte, "Objects are not equals")
        }
        catch
        {
            XCTFail("Read failed : \(error)")
        }
    }

public func test_readInt16()
    {
        do
        {
            var data = Array<Byte>()
            var value = 1
            data.append(((value >> 8) & 0xFF).toByte())
            data.append((value & 0xFF).toByte())
            value = -128
            data.append(((value >> 8) & 0xFF).toByte())
            data.append((value & 0xFF).toByte())
            value = -32100
            data.append(((value >> 8) & 0xFF).toByte())
            data.append((value & 0xFF).toByte())
            value = 32100
            data.append(((value >> 8) & 0xFF).toByte())
            data.append((value & 0xFF).toByte())
            let byteStreamReader = ByteStreamReader(data, true)
            var byte = try  byteStreamReader.readInt16()
            XCTAssertEqual(1, byte, "Objects are not equals")
            byte = try  byteStreamReader.readInt16()
            XCTAssertEqual(-128, byte, "Objects are not equals")
            byte = try  byteStreamReader.readInt16()
            XCTAssertEqual(-32100, byte, "Objects are not equals")
            byte = try  byteStreamReader.readInt16()
            XCTAssertEqual(32100, byte, "Objects are not equals")
        }
        catch
        {
            XCTFail("Read failed : \(error)")
        }
    }

public func test_readUInt16()
    {
        do
        {
            var data = Array<Byte>()
            var value = 1
            data.append(((value >> 8) & 0xFF).toByte())
            data.append((value & 0xFF).toByte())
            value = 65432
            data.append(((value >> 8) & 0xFF).toByte())
            data.append((value & 0xFF).toByte())
            value = 32211
            data.append(((value >> 8) & 0xFF).toByte())
            data.append((value & 0xFF).toByte())
            value = 11100
            data.append(((value >> 8) & 0xFF).toByte())
            data.append((value & 0xFF).toByte())
            let byteStreamReader = ByteStreamReader(data, true)
            var byte = try  byteStreamReader.readUInt16()
            XCTAssertEqual(1, byte, "Objects are not equals")
            byte = try  byteStreamReader.readUInt16()
            XCTAssertEqual(65432, byte, "Objects are not equals")
            byte = try  byteStreamReader.readUInt16()
            XCTAssertEqual(32211, byte, "Objects are not equals")
            byte = try  byteStreamReader.readUInt16()
            XCTAssertEqual(11100, byte, "Objects are not equals")
        }
        catch
        {
            XCTFail("Read failed : \(error)")
        }
    }

public func test_readInt32()
    {
        do
        {
            var data = Array<Byte>()
            var value = 1
            data.append(((value >> 24) & 0xFF).toByte())
            data.append(((value >> 16) & 0xFF).toByte())
            data.append(((value >> 8) & 0xFF).toByte())
            data.append((value & 0xFF).toByte())
            value = 123456
            data.append(((value >> 24) & 0xFF).toByte())
            data.append(((value >> 16) & 0xFF).toByte())
            data.append(((value >> 8) & 0xFF).toByte())
            data.append((value & 0xFF).toByte())
            value = -123456
            data.append(((value >> 24) & 0xFF).toByte())
            data.append(((value >> 16) & 0xFF).toByte())
            data.append(((value >> 8) & 0xFF).toByte())
            data.append((value & 0xFF).toByte())
            value = 248163264
            data.append(((value >> 24) & 0xFF).toByte())
            data.append(((value >> 16) & 0xFF).toByte())
            data.append(((value >> 8) & 0xFF).toByte())
            data.append((value & 0xFF).toByte())
            value = -248163264
            data.append(((value >> 24) & 0xFF).toByte())
            data.append(((value >> 16) & 0xFF).toByte())
            data.append(((value >> 8) & 0xFF).toByte())
            data.append((value & 0xFF).toByte())
            let byteStreamReader = ByteStreamReader(data, true)
            var byte = try  byteStreamReader.readInt32()
            XCTAssertEqual(1, byte, "Objects are not equals")
            byte = try  byteStreamReader.readInt32()
            XCTAssertEqual(123456, byte, "Objects are not equals")
            byte = try  byteStreamReader.readInt32()
            XCTAssertEqual(-123456, byte, "Objects are not equals")
            byte = try  byteStreamReader.readInt32()
            XCTAssertEqual(248163264, byte, "Objects are not equals")
            byte = try  byteStreamReader.readInt32()
            XCTAssertEqual(-248163264, byte, "Objects are not equals")
        }
        catch
        {
            XCTFail("Read failed : \(error)")
        }
    }

public func test_readUInt32()
    {
        do
        {
            var data = Array<Byte>()
            var value = 1
            data.append(((value >> 24) & 0xFF).toByte())
            data.append(((value >> 16) & 0xFF).toByte())
            data.append(((value >> 8) & 0xFF).toByte())
            data.append((value & 0xFF).toByte())
            value = 123456
            data.append(((value >> 24) & 0xFF).toByte())
            data.append(((value >> 16) & 0xFF).toByte())
            data.append(((value >> 8) & 0xFF).toByte())
            data.append((value & 0xFF).toByte())
            value = 123456789
            data.append(((value >> 24) & 0xFF).toByte())
            data.append(((value >> 16) & 0xFF).toByte())
            data.append(((value >> 8) & 0xFF).toByte())
            data.append((value & 0xFF).toByte())
            value = 248163264
            data.append(((value >> 24) & 0xFF).toByte())
            data.append(((value >> 16) & 0xFF).toByte())
            data.append(((value >> 8) & 0xFF).toByte())
            data.append((value & 0xFF).toByte())
            value = 1248163264
            data.append(((value >> 24) & 0xFF).toByte())
            data.append(((value >> 16) & 0xFF).toByte())
            data.append(((value >> 8) & 0xFF).toByte())
            data.append((value & 0xFF).toByte())
            let byteStreamReader = ByteStreamReader(data, true)
            var byte = try  byteStreamReader.readUInt32()
            XCTAssertEqual(Long(1), byte, "Objects are not equals")
            byte = try  byteStreamReader.readUInt32()
            XCTAssertEqual(Long(123456), byte, "Objects are not equals")
            byte = try  byteStreamReader.readUInt32()
            XCTAssertEqual(Long(123456789), byte, "Objects are not equals")
            byte = try  byteStreamReader.readUInt32()
            XCTAssertEqual(Long(248163264), byte, "Objects are not equals")
            byte = try  byteStreamReader.readUInt32()
            XCTAssertEqual(Long(1248163264), byte, "Objects are not equals")
        }
        catch
        {
            XCTFail("Read failed : \(error)")
        }
    }

public func test_readFloat()
    {
        do
        {
            var data = Array<Byte>()

            // value=1.0 , intBits=1065353216 | hex=3f 80 00 00
            data.append(0x3F.toByte())
            data.append(0x80.toByte())
            data.append(0x00.toByte())
            data.append(0x00.toByte())

            // value=-1234.5677 , intBits=-996519381 | hex=c4 9a 52 2b
            data.append(0xC4.toByte())
            data.append(0x9A.toByte())
            data.append(0x52.toByte())
            data.append(0x2B.toByte())

            // value=1234.5677 , intBits=1150964267 | hex=44 9a 52 2b
            data.append(0x44.toByte())
            data.append(0x9A.toByte())
            data.append(0x52.toByte())
            data.append(0x2B.toByte())

            let byteStreamReader = ByteStreamReader(data, true)
            var byte = try  byteStreamReader.readFloat()
            XCTAssertEqual(Float( 1), byte, "Objects are not equals")
            byte = try  byteStreamReader.readFloat()
            XCTAssertEqual(Float(-1234.5678), byte, "Objects are not equals")
            byte = try  byteStreamReader.readFloat()
            XCTAssertEqual(Float( 1234.5678), byte, "Objects are not equals")
        }
        catch
        {
            XCTFail("Read failed : \(error)")
        }
    }
}
