
public class BluetoothInterfaceDummy : BluetoothInterface {

    public func initialize()
    {
        print("TODO : Inject BluetoothInterface")
    }

    public func startScan(_ scanReceiver: @escaping  (BluetoothDevice) -> Void)
    {
        print("TODO : Inject BluetoothInterface")
    }

    public func stoScan()
    {
        print("TODO : Inject BluetoothInterface")
    }

    public func connect(_ device: BluetoothDevice)
    {
        print("TODO : Inject BluetoothInterface")
    }
}
