//
//  ContentView.swift
//  Challenge-Converter
//
//  Created by Jeng Yang on 05/12/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    // Selected unit type index
    @State private var sourceUnitTypeIndex = 0
    @State private var destinationUnitTypeIndex = 1
    
    /// Selected source indexes for all unit types
    @State private var sourceNamedUnitIndexes = Array(repeating: 0, count: Length.units.count)
    
    var lengthUnits: [NamedUnit] {
        return Length.units
    }
    
    // Selected source unit
    var sourceLengthUnit: NamedUnit {
        return lengthUnits[sourceUnitTypeIndex]
    }
    
    // Selected destination unit
    var destinationLengthUnit: NamedUnit {
        return lengthUnits[destinationUnitTypeIndex]
    }
    
    // Conversion result
    var result: Double {
        let source = Measurement(value: Double(inputValue) , unit: sourceLengthUnit.unit)
        return source.converted(to: destinationLengthUnit.unit).value
    }
    
    var body: some View {
        NavigationView{
            
            Form {
                Section{
                    HStack{
                        TextField("Amount", value: $inputValue, format: .number)
                            .keyboardType(.numberPad)
                        
                        Spacer()
                        Text(sourceLengthUnit.name)
                    }
                    
                    
                    Picker("Input Unit", selection: $sourceUnitTypeIndex) {
                        ForEach(0 ..< lengthUnits.count, id: \.self){ i in
                            Text(self.lengthUnits[i].unit.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Please insert your value")
                }
                
                Section{
                    HStack{
                        Text(result, format: .number)
                        Spacer()
                        Text(destinationLengthUnit.name)
                    }
                    
                    
                    Picker("Output Unit", selection: $destinationUnitTypeIndex) {
                        ForEach(0 ..< lengthUnits.count, id: \.self){ i in
                            Text(self.lengthUnits[i].unit.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Output Value")
                }
            }
            .navigationTitle("Length Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
