//
//  AgePickerView.swift
//  Secret Place
//
//  Created by 123 on 16.03.24.
//

import SwiftUI

struct AgePicker: View {
    @Binding var selectedAge: Int
    let ages = Array(0...99)

    var body: some View {
        Picker("Возраст", selection: $selectedAge) {
            ForEach(ages, id: \.self) { age in
                Text("\(age)").tag(age)
            }
        }
        .pickerStyle(WheelPickerStyle())
    }
}

