//
//  ContentView.swift
//  Memorize
//
//  Created by Roland Kajatin on 04/11/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
                .foregroundColor(.indigo)
            Text("Hello, world!")
        }
        .padding(.horizontal)
        .foregroundColor(.accentColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
