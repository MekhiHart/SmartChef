//
//  TextInput.swift
//  SmartChef
//
//  Created by Mekhi Hart Dela Cruz on 12/25/23.
//

import SwiftUI


struct TextInput: View {
    @ObservedObject var vm: TextInputViewModel

    init(value: Binding<String>, mode: TextInputViewModel.Mode, isHidden: Bool) {
        self.vm = TextInputViewModel(value: value, mode: mode, isHidden: isHidden)
    }
    
    var genericFieldText: some View {
        Group {
            if vm.mode != .password ||  vm.mode != .confirmPassword{
                ZStack{
                    TextField(vm.mode.info.handle, text: vm.$value)
                        .opacity(vm.isHidden ? 0 : 1)
                    SecureField(vm.mode.info.handle, text: vm.$value)
                        .opacity(vm.isHidden ? 1 : 0)
                
                }
            }  else {
                TextField(vm.mode.info.handle, text: vm.$value)
                }
            
        }
    } // genericFieldText

    var icon: some View {
        Group {
            if vm.mode == .password {
                Image(systemName: vm.isHidden ? "eye.slash" :"eye")
                    .onTapGesture {
                        vm.isHidden.toggle()
                        print("isHidden: \(vm.isHidden)")
                    }

            } else {
                vm.mode.info.icon
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
            TextInput(value: .constant(""), mode: .username, isHidden: false)
//            TextInput(value: "", mode: .password, isHidden: true)
        }
    }
}
