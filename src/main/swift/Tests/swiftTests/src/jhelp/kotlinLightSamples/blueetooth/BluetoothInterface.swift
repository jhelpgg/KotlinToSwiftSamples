
public protocol BluetoothInterface {

    func initialize()

    func startScan(_ scanReceiver: @escaping (BluetoothDevice)->Void)

    func stoScan()

    func connect(_ device:BluetoothDevice)
}
