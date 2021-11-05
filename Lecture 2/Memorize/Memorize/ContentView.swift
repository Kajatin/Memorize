//
//  ContentView.swift
//  Memorize
//
//  Created by Roland Kajatin on 04/11/2021.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🐳", "🦖", "🦉", "🐙", "🐶", "🐼", "🐹", "🐷", "🐵", "🐴", "🐛", "🐞", "🐌", "🐝", "🐢", "🦑", "🦀", "🐡", "🦣", "🦌", "🦚", "🦫", "🦥", "🦔"]
    @State var emojiCount = 10

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 100))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button {
            emojiCount -= 1
        } label: {
            Image(systemName: "minus.circle")
        }
        .disabled(emojiCount <= 0)
    }
    
    var add: some View {
        Button {
            emojiCount += 1
        } label: {
            Image(systemName: "plus.circle")
        }
        .disabled(emojiCount >= emojis.count)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    var content: String

    var body: some View {
        ZStack {
            if isFaceUp {
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(lineWidth: 3)
                .foregroundColor(.indigo)
            Text(content).font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.linearGradient(Gradient(colors: [.indigo, .purple]), startPoint: .top, endPoint: .bottom))
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
