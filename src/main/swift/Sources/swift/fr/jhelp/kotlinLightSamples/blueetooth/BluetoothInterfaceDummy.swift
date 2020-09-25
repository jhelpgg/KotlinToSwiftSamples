
class BluetoothInterfaceDummy : BluetoothInterface {

    func initialize()
    {
        print("TODO : Inject BluetoothInterface")
    }

    func startScan(_ scanReceiver: @escaping  (BluetoothDevice) -> Void)
    {
        print("TODO : Inject BluetoothInterface")
    }

    func stoScan()
    {
        print("TODO : Inject BluetoothInterface")
    }

    func connect(_ device: BluetoothDevice)
    {
        print("TODO : Inject BluetoothInterface")
    }
}
