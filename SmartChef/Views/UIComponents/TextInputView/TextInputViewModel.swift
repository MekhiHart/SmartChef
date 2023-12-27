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

    var genericFieldText: some View {
        Group {
            if !isHidden {
                TextField(mode.info.handle, text: $value)
            } else {
                SecureField(mode.info.handle, text: $value)
            }
        }
    } // genericFieldText

    var icon: some View {
        Group {
            if mode == .password {
                Image(systemName: isHidden ? "eye" : "eye.slash")
                    .onTapGesture {
                        self.isHidden.toggle()
                        print("isHidden: \(self.isHidden)")
                    }

            } else {
                mode.info.icon
            }
        }
    } // icon

    enum Mode: String {
        case username
        case password

        var info: (handle: String, icon: Image) {
            switch self {
            case .username:
                return ("Username", Image(systemName: "person"))
            case .password:
                return ("Password", Image(systemName: "eye"))
            }
        }
    } // Mode
}
