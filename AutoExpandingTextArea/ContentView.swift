//
//  ContentView.swift
//  AutomaticallyExpendingTextArea
//
//  Created by Ivan Lvov on 22.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    
    var body: some View {
        ZStack{
            AutoExpandingTextArea(text:  $text)
                .padding(.leading, 11)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 2))
                .foregroundColor(Color.black)
        }
        .padding(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

