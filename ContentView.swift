import SwiftUI

struct ContentView: View {
    
    @State private var OUTPUT = 1
    
    @State private var USBA = 0
    @State private var USBABANDWITH = 1
    
    @State private var USBC = 0
    @State private var USBCBANDWITH = 1
    
    @State private var HDMI = 0
    @State private var HDMIBANDWITH = 1
    
    @State private var DP = 0
    @State private var DPBANDWITH = 1
    
    @State private var ETHERNET = 0
    @State private var ETHERNETBANDWITH = 1
    
    @State private var AUX = 0
    
    @State private var POWER = false
    @State private var POWERWATT = 1
    
    @State private var done = false

    
    var body: some View {
        NavigationView {
            Form {
                Picker("OUTPUT", selection: $OUTPUT) {
                    Text("USB C (40gbps)")
                        .tag(1)
                    Text("USB A (20gbps)")
                        .tag(2)
                }
                Section(header: Text("USB A (\(USBA))")) {
                    Stepper(value: $USBA, in: 0...10) {
                        Text("Quantity")
                    }
                    Picker("Bandwith", selection: $USBABANDWITH) {
                        Text("10gbps")
                            .tag(1)
                        Text("20gbps")
                            .tag(2)
                    }
                }
                Section(header: Text("USB C (\(USBC))")) {
                    Stepper(value: $USBC, in: 0...10) {
                        Text("Quantity")
                    }
                    Picker("Bandwith", selection: $USBCBANDWITH) {
                        Text("20gbps")
                            .tag(1)
                        Text("40gbps")
                            .tag(2)
                    }
                }
                Section(header: Text("HDMI (\(HDMI))")) {
                    Stepper(value: $HDMI, in: 0...10) {
                        Text("Quantity")
                    }
                    Picker("Bandwith", selection: $HDMIBANDWITH) {
                        Text("1080 @60")
                            .tag(1)
                        Text("1080 @120")
                            .tag(2)
                        Text("1080 @144")
                            .tag(3)
                        Text("4K @60")
                            .tag(4)
                        Text("4K @120")
                            .tag(5)
                        Text("4K @144")
                            .tag(6)
                    }
                }
                Section(header: Text("DP (\(DP))")) {
                    Stepper(value: $DP, in: 0...10) {
                        Text("Quantity")
                    }
                    Picker("Bandwith", selection: $DPBANDWITH) {
                        Text("1080 @60")
                            .tag(1)
                        Text("1080 @120")
                            .tag(2)
                        Text("1080 @144")
                            .tag(3)
                        Text("4K @60")
                            .tag(4)
                        Text("4K @120")
                            .tag(5)
                        Text("4K @144")
                            .tag(6)
                    }
                }
                Section(header: Text("ETHERNET (\(ETHERNET))")) {
                    Stepper(value: $ETHERNET, in: 0...10) {
                        Text("Quantity")
                    }
                    Picker("Bandwith", selection: $ETHERNETBANDWITH) {
                        Text("10gbps")
                            .tag(1)
                        Text("40gbps")
                            .tag(2)
                    }
                }
                Section(header: Text("AUX (\(AUX))")) {
                    Stepper(value: $AUX, in: 0...3) {
                        Text("Quantity")
                    }
                }
                Section(header: Text("POWER")) {
                    Toggle("Power", isOn: $POWER)
                    Picker("Wattage", selection: $POWERWATT) {
                        Text("25W")
                            .tag(1)
                        Text("100W")
                            .tag(2)
                    }
                }
                Button("DONE") {
                    print("DONE")
                    done = true
                }
                .popover(isPresented: $done) {
                    Form {
                        Button("Back") {
                            done = false
                        }
                    }
                }
            }
                .navigationTitle("YUFI")
        }
            .navigationViewStyle(.stack)
    }
}

