//
//  ContentView.swift
//  Memorize
//
//  Created by Roland Kajatin on 04/11/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var themes = ["pawprint", "car", "fork.knife"]
    var descriptions = ["Animals", "Vehicles", "Food"]

    var body: some View {
        VStack {
            Text("Memorize").font(.largeTitle)
            Spacer(minLength: 20)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 100))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            Spacer()
            HStack {
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(0..<themes.count) { idx in
//                        ThemeButtonView(theme: themes[idx], text: descriptions[idx], emojis: $emojis, emojiCount: $emojiCount)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.strokeBorder(lineWidth: 3).foregroundColor(.indigo)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill(.linearGradient(Gradient(colors: [.indigo, .purple]), startPoint: .top, endPoint: .bottom))
            }
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
    static let game = EmojiMemoryGame()
    
    static var previews: some View {
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}
