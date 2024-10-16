//
//  UIApplication.swift
//  SwiftfulCryptoG
//
//  Created by Dhiman Das on 18.09.24.
//

import Foundation
import SwiftUI
extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
