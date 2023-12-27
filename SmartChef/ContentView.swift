//
//  ContentView.swift
//  SmartChef
//
//  Created by Mekhi Hart Dela Cruz on 12/25/23.
//

import SwiftUI

struct ContentView: View {
    @State var test = "Hi"
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            TextInput(value: $test, mode: .username)
            TextInput(value: $password, mode: .password)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
