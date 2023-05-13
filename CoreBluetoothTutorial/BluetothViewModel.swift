//
//  BluetothViewModel.swift
//  CoreBluetoothTutorial
//
//  Created by Sabal on 5/12/23.
//

import Foundation
import CoreBluetooth

//The code will just find the nearby bluetooth devices and show in screen whose bluetooth is turned On 
class bluetoothViewModel: NSObject, ObservableObject{
    var centralManager: CBCentralManager?
    var peripherals: [CBPeripheral] = []
    @Published var deviceNames: [String] = []
    
    override init(){
        super.init()
        self.centralManager = CBCentralManager(delegate: self, queue: .main)
    }
}

extension bluetoothViewModel: CBCentralManagerDelegate{
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            centralManager?.scanForPeripherals(withServices: nil)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        if !peripherals.contains(peripheral) {
            self.peripherals.append(peripheral)
            self.deviceNames.append(peripheral.name ?? " Unnamed Devices ")
        }
    }
    
}
