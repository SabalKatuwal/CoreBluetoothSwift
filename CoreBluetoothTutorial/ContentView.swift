//
//  ContentView.swift
//  CoreBluetoothTutorial
//
//  Created by Sabal on 5/12/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var btViewModel = bluetoothViewModel()
    var body: some View {
        NavigationView {
            List(btViewModel.deviceNames, id: \.self){ items in
                Text(items)
            }
            .navigationTitle("Nearby Devices")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
