package fr.jhelp.kotlinLightSamples.blueetooth

interface BluetoothInterface
{
    fun initialize()

    fun startScan(scanReceiver:(BluetoothDevice)->Unit)

    fun stoScan()

    fun connect(device:BluetoothDevice)
}