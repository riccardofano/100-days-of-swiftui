//
//  ContentView.swift
//  Converter
//
//  Created by Riccardo Fano on 2023-07-01.
//

import SwiftUI

extension UnitTemperature {
    var name: String {
        switch self {
        case .celsius:
            return "Celsius"
        case .fahrenheit:
            return "Fahrenheit"
        default:
            return "Kelvin"
        }
    }
    
    /// Kelvin is the base unit
    private func toBaseUnit(_ value: Double, from: UnitTemperature) -> Double {
        switch self {
        case .celsius:
            return value + 273.15
        case .fahrenheit:
            return (value + 459.67) * 5 / 9
        default:
            return value
        }
    }
    
    /// Kelvin is the base unit
    private func fromBaseUnit(_ value: Double, to: UnitTemperature) -> Double {
        switch to {
        case .celsius:
            return value - 273.15
        case .fahrenheit:
            return (value - 273.15) * 9 / 5 + 32
        default:
            return value
        }
    }
    
    func convert(_ value: Double, to: UnitTemperature) -> Double {
        let normalized = toBaseUnit(value, from: self)
        return fromBaseUnit(normalized, to: to)
        
    }
}

struct ContentView: View {
    let temperatureUnits: [UnitTemperature] = [.celsius, .fahrenheit, .kelvin]
    
    @State private var degrees: Double = 15.00
    @State private var convertFrom = UnitTemperature.celsius
    @State private var convertTo = UnitTemperature.fahrenheit
    
    private var formatStyle = Measurement<UnitTemperature>.FormatStyle(
        width: .abbreviated,
        numberFormatStyle: .number
    )
    
    private var convertedDegrees: Double {
        convertFrom.convert(degrees, to: convertTo)
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Text("Degrees: ")
                        TextField("Degrees", value: $degrees, format: .number)
                            .keyboardType(.decimalPad)
                    }

                    Picker("Convert from", selection: $convertFrom) {
                        ForEach(temperatureUnits, id: \.self) {
                            Text($0.name)
                        }
                    }

                    Picker("Convert to", selection: $convertTo) {
                        ForEach(temperatureUnits, id: \.self) {
                            Text($0.name)
                        }
                    }
                }

                Section {
                    Text("\(convertedDegrees.formatted())\(convertTo.symbol)")
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("Temperature converter")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
