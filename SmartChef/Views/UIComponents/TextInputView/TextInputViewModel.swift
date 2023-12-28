//
//  TextInputViewModel.swift
//  SmartChef
//
//  Created by Mekhi Hart Dela Cruz on 12/27/23.
//

import Foundation
import SwiftUI

class TextInputViewModel: ObservableObject {
    @Binding var value: String
    let mode: Mode
    @Published var isHidden: Bool

    init(value: Binding<String>, mode: Mode, isHidden: Bool) {
        self._value = value
        self.mode = mode
        self.isHidden = isHidden
    } // init



    enum Mode: String {
        case username, password, firstName, lastName, emailAddress, confirmPassword
        var info: (handle: String, icon: Image) {
            switch self {
            case .username:
                return ("Username", Image(systemName: "person"))
            case .password:
                return ("Password", Image(systemName: "eye"))
            case .confirmPassword:
                return ("Confirm Password", Image(systemName: "eye"))
            case .firstName:
                return ("First Name", Image(systemName: "person"))
            case .lastName:
                return ("Last Name", Image(systemName: "person"))
            case .emailAddress:
                return ("Emil Address", Image(systemName: "mail"))
            }
            
        }
    } // Mode
}
