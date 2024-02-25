//
//  RoundedRectangularButtonView.swift
//  SmartChef
//
//  Created by Mekhi Hart Dela Cruz on 12/28/23.
//

import SwiftUI

struct RoundedRectangularButtonView: View {
    
    var icon: String
    var text: String
    var color: Color
    var contentAlignment: ContentAlignment
    var onPress: () -> Void
    
    
    enum ContentAlignment{
        case left, center, right
    }
    
    var content: some View{
        HStack{
            Image(systemName: icon)
            Text(text)
        }
        .padding(10)
    }
    
    
    var body: some View {
        Button{
            onPress()
        } label: {
            
            switch contentAlignment {
            case .left:
                // Align content to the left
                content
                Spacer()
            case .center:
                // Align content to the center
                HStack {
                    Spacer()
                    content
                    Spacer()
                }
            case .right:
                // Align content to the right
                Spacer()
                content
            }
            
            
        }
        .frame(height: 50)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(RoundedRectangle(cornerRadius: 10)
            .stroke(Color.clear))
        .background(color)
        .cornerRadius(10)
    
    }
}

#Preview {
    RoundedRectangularButtonView(
        icon: "eye", text: "Hello", color: .yellow, contentAlignment: .right){
            // DO LOGIC HERE
        }
}
