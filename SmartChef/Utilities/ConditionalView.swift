//
//  ConditionalView.swift
//  SmartChef
//
//  Created by Mekhi Hart Dela Cruz on 12/25/23.
//

import SwiftUI

struct EmptyModifier: ViewModifier{
    var isEmpty: Bool
    
    func body(content: Content) -> some View{
        Group{
            if isEmpty{
                EmptyView()
            } else{
                content
            }
        }
    }
}

extension View{
    func isEmpty(_ bool: Bool) -> some View{
        modifier(EmptyModifier(isEmpty: bool))
    }
}
