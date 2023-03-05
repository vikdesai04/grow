//
//  MaterialUITextField.swift
//  grow-ios
//
//  Created by Sahil Ambardekar on 8/11/20.
//  Copyright © 2020 hackthis. All rights reserved.
//

import SwiftUI
import UIKit
import Material

struct MaterialUITextField: UIViewRepresentable {
    @Binding var placeholder: String
    @Binding var text: String
 
    func makeUIView(context: Context) -> Material.TextField {
        let textField = Material.TextField()
        textField.placeholder = placeholder
        textField.clearButtonMode = .whileEditing
        textField.placeholderActiveColor = Color.green1.uiColor()
        textField.dividerActiveColor = Color.green1.uiColor()
        textField.text = text
        textField.isUserInteractionEnabled = true
        //textField.delegate = context.coordinator
        if placeholder == "name" {
            (UIApplication.shared.delegate as! AppDelegate).nameTextField = textField
        } else if placeholder == "plant code" {
            (UIApplication.shared.delegate as! AppDelegate).plantCodeTextField = textField
        }
        return textField
    }

    func updateUIView(_ uiView: Material.TextField, context: Context) {
        uiView.placeholder = placeholder
        uiView.text = text
    }
    
    func makeCoordinator() -> MaterialUITextField.Coordinator {
        Coordinator($text)
    }

    class Coordinator: NSObject, UITextFieldDelegate {
        var text:Binding<String>

        init(_ text:Binding<String>) {
            self.text = text
        }

        func textViewDidChange(_ textField: UITextField) {
            self.text.wrappedValue = textField.text ?? ""
        }

    }
}
