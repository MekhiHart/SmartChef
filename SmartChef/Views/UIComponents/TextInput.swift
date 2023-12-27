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
    
    var genericFieldText:some View{
        Group{
            if !isHidden{
                TextField(mode.info.handle, text: $value)
            } else{
                SecureField(mode.info.handle, text: $value)
            }
        }
    } // genericFieldText
    
    var icon: some View{
        Group{
            if mode == .password{
                Image(systemName: isHidden ? "eye" : "eye.slash")
                    .onTapGesture {
                        isHidden.toggle()
                    }
                
            } else{
                mode.info.icon
            }
        }
    }
    
    enum Mode: String{
        case username
        case password
//        case firstName = "First Name"
//        case lastName = "Last Name"
//        case emailAddress = "Email Address"
        
        var info: (handle: String, icon: Image){
            switch self{
            case .username:
                return ("Username", Image(systemName: "person"))
            case .password:
                return ("Password", Image(systemName: "eye"))
            }
        }
    } // Mode
    
    var body: some View {
        HStack{
            genericFieldText
                .padding(.leading, 13)
                .padding(.vertical, 10)
            
            icon
                .frame(width: 15, height: 20)
                .padding(.horizontal, 10)
        } // HStack
        .frame(height: 35)
        .border(.gray, width: 2)
    } // body
    
} // TextInput

#Preview {
    Group{
        TextInput(value: .constant(""), mode: .username, isHidden: false)
        TextInput(value: .constant(""), mode: .password, isHidden: true)
    }
    
}
