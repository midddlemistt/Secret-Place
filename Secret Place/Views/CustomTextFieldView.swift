//
//  CustomTextFieldView.swift
//  Secret Place
//
//  Created by 123 on 16.03.24.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
    }
}

