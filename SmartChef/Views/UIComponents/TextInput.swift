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
    
    init(value: String, mode: Mode, isHidden: Bool) {
        self.value = value
        self.mode = mode
        self._isHidden = State(initialValue: mode == .password ? false : true)
    }
    
    var genericFieldText:some View{
        Group{
            if self.{
                TextField(mode.info.handle, text: $value)
            } else{
                SecureField(mode.info.handle, text: $value)
            }
        }
    } // genericFieldText
    
    enum Mode: String{
        case username
        case password
//        case firstName = "First Name"
//        case lastName = "Last Name"
//        case emailAddress = "Email Address"
        
        var info: (handle: String, icon: Image, onTapAction: () -> Void){
            switch self{
            case .username:
                return ("Username", Image(systemName: "person"), {})
            case .password:
                return ("Password", Image(systemName: "eye"),  {})
            }
        }
    } // Mode
    
    var body: some View {
        HStack{
            genericFieldText
                .padding(.leading, 13)
                .padding(.vertical, 10)
            
            mode.info.icon
                .frame(width: 25)
                .padding(.horizontal, 8)
                .onTapGesture {
                    isHidden.toggle()
                }
        } // HStack
        .border(.gray, width: 2)
    } // body
    
} // TextInput

#Preview {
    Group{
        TextInput(value: .constant(""), mode: .username)
        TextInput(value: .constant(""), mode: .password)
    }
    
}
