//
//  AutoExpendingTextArea.swift
//  AutomaticallyExpendingTextArea
//
//  Created by Ivan Lvov on 22.02.2023.
//

import Foundation
import SwiftUI

struct AutoExpandingTextArea: View {
    // MARK: - PROPERTIES
    
    @Binding var text: String
    
    @State private var calculatedHeight: CGFloat = 0
    
    // MARK: - FUNCTIONS
    func updateHeight(textSize: CGSize){
        withAnimation(.linear(duration: 0.2)){
            calculatedHeight = textSize.height + 20
        }
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack(alignment: .leading) {
            Text(text)
                .background(ViewGeometry())
                .padding(10)
                .onPreferenceChange(ViewSizeKey.self) {
                    //self.textSize = $0
                    updateHeight(textSize: $0)
                }
            
            TextEditor(text: $text)
                .frame(height: calculatedHeight)
        }
    }
}


// MARK: - PREVIW
struct AutoExpandingTextArea_Previews: PreviewProvider {
    
    static var previews: some View {
        AutoExpandingTextArea(text: .constant("Hello"))
            .padding(2)
            .background(
                .red.opacity(0.2)
            )
        
    }
}


// MARK: - ViewGeometry
struct ViewGeometry: View {
    var body: some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: ViewSizeKey.self, value: geometry.size)
        }
    }
}

// MARK: - ViewSizeKey
struct ViewSizeKey: PreferenceKey {
    static var defaultValue: CGSize = .zero

    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}
