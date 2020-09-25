package fr.jhelp.kotlinLightSamples.blueetooth

class BluetoothInterfaceDummy : BluetoothInterface
{
    override fun initialize()
    {
        println("TODO : Inject BluetoothInterface")
    }

    override fun startScan(scanReceiver: (BluetoothDevice) -> Unit)
    {
        println("TODO : Inject BluetoothInterface")
    }

    override fun stoScan()
    {
        println("TODO : Inject BluetoothInterface")
    }

    override fun connect(device: BluetoothDevice)
    {
        println("TODO : Inject BluetoothInterface")
    }
}