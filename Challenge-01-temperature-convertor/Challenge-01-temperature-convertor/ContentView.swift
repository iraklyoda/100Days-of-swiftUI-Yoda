//
//  ContentView.swift
//  Challenge-01-temperature-convertor
//
//  Created by Irakli Iobashvili on 10.07.24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = "Fahrenheit"
    @State private var outputUnit = "Fahrenheit"
    
    @State private var input: Double = 0.0

    let temperatureUnits = ["Fahrenheit", "Celsius", "Kelvin"]
    
    
    private var celsius: Double {
        switch inputUnit {
        case "Fahrenheit":
            return (input - 32) * 5/9
        case "Kelvin":
            return input - 273.15
        case "Celsius":
            return input
        default:
            return input
        }
    }
    
    private var output: Double {
        switch outputUnit {
        case "Fahrenheit":
            return (celsius * 9/5) + 32
        case "Kelvin":
            return celsius + 273.15
        case "Celsius":
            return celsius
        default:
            return celsius
            
        }
    }

    
    var unitSymbol: String {
        if outputUnit == temperatureUnits[0] {
            return "°F"
        } else if outputUnit == temperatureUnits[1] {
            return "°C"
        } else {
            return "K"
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Units") {
                    Picker("Input Unit:", selection: $inputUnit) {
                        ForEach(temperatureUnits, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    Picker("Output Unit:", selection: $outputUnit) {
                        ForEach(temperatureUnits, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
                Section("Input") {
                    TextField("Input", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                    Text("Output: \(output.formatted()) \(unitSymbol)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
