//
//  ContentView.swift
//  Memorize
//
//  Created by Roland Kajatin on 04/11/2021.
//

import SwiftUI

struct ContentView: View {
    var themes = ["pawprint", "car", "fork.knife"]
    var descriptions = ["Animals", "Vehicles", "Food"]
    @State var emojis = ["🐳", "🦖", "🦉", "🐙", "🐶", "🐼", "🐹", "🐷", "🐵", "🐴", "🐛", "🐞", "🐌", "🐝", "🐢", "🦑", "🦀", "🐡", "🦣", "🦌", "🦚", "🦫", "🦥", "🦔"]
    @State var emojiCount = 10

    var body: some View {
        VStack {
            Text("Memorize").font(.largeTitle)
            Spacer(minLength: 20)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 100))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack {
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(0..<themes.count) { idx in
                        ThemeButtonView(theme: themes[idx], text: descriptions[idx], emojis: $emojis, emojiCount: $emojiCount)
                    }
                }
            }
        }
        .padding(.horizontal)
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

struct ThemeButtonView: View {
    var theme: String
    var text: String
    @Binding var emojis: [String]
    @Binding var emojiCount: Int
    
    var body: some View {
        Button {
            switch theme {
            case "pawprint":
                self.emojis = ["🐳", "🦖", "🦉", "🐙", "🐶", "🐼", "🐹", "🐷", "🐵", "🐴", "🐛", "🐞", "🐌", "🐝", "🐢", "🦑", "🦀", "🐡", "🦣", "🦌", "🦚", "🦫", "🦥", "🦔"].shuffled()
                self.emojiCount = Int.random(in: 8..<self.emojis.count)
            case "car":
                self.emojis = ["🚗", "🚕", "🚙", "🚌", "🏎", "🚓", "🚑", "🛴", "🚲", "🚆", "✈️", "🚀", "🚁", "⛵️", "🚜", "🚛", "🚔", "🚍", "🛶", "🛺", "🚚", "🦽", "🚊", "🛸"].shuffled()
                self.emojiCount = Int.random(in: 8..<self.emojis.count)
            case "fork.knife":
                self.emojis = ["🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍓", "🍑", "🍍", "🍅", "🍆", "🥝", "🌽", "🥕", "🧄", "🥐", "🥨", "🧀", "🍗", "🥓", "🌮", "🌯", "🍔", "🧇"].shuffled()
                self.emojiCount = Int.random(in: 8..<self.emojis.count)
            default:
                self.emojis = ["🐳", "🦖", "🦉", "🐙", "🐶", "🐼", "🐹", "🐷", "🐵", "🐴", "🐛", "🐞", "🐌", "🐝", "🐢", "🦑", "🦀", "🐡", "🦣", "🦌", "🦚", "🦫", "🦥", "🦔"]
                self.emojiCount = Int.random(in: 8..<self.emojis.count)
            }
        } label: {
            VStack {
                Image(systemName: theme).font(.largeTitle)
                Text(text).font(.body)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
