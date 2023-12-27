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

    var body: some View {
        HStack {
            vm.genericFieldText
                .padding(.leading, 13)
                .padding(.vertical, 10)

            vm.icon
                .frame(width: 15, height: 20)
                .padding(.horizontal, 10)
        }
        .frame(height: 35)
        .border(Color.gray, width: 2)
    }
}

struct TextInput_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TextInput(value: .constant(""), mode: .username, isHidden: false)
//            TextInput(value: "", mode: .password, isHidden: true)
        }
    }
}
