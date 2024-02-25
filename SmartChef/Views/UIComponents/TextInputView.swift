//
//  TextInput.swift
//  SmartChef
//
//  Created by Mekhi Hart Dela Cruz on 12/25/23.
//

import SwiftUI


struct TextInput: View {
    @Binding var value: String
    let mode: Mode
    @State var isHidden: Bool
    
    
    var genericFieldText: some View {
        Group {
            if mode != .password ||  mode != .confirmPassword{
                ZStack{
                    TextField(mode.info.handle, text: $value)
                        .opacity(isHidden ? 0 : 1)
                    SecureField(mode.info.handle, text: $value)
                        .opacity(isHidden ? 1 : 0)
                
                }
            }  else {
                TextField(mode.info.handle, text: $value)
                }
            
        }
    } // genericFieldText

    var icon: some View {
        Group {
            if mode == .password {
                Image(systemName: isHidden ? "eye.slash" :"eye")
                    .onTapGesture {
                        isHidden.toggle()
                    }

            } else {
                mode.info.icon
            }
        }
    } // icon

    var body: some View {
        HStack {
            genericFieldText
                .padding(.leading, 13)
                .padding(.vertical, 10)

            icon
                .frame(width: 15, height: 20)
                .padding(.trailing, 13)
        } //HStack
        .frame(height: 44)
        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))

        
    } // View
}

struct TextInput_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TextInput(value: .constant(""), mode: .password, isHidden: true)
//            TextInput(value: "", mode: .password, isHidden: true)
        }
    }
}

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
