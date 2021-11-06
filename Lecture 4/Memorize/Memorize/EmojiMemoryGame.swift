//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Roland Kajatin on 06/11/2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    // type variable
    static let emojis = ["🐳", "🦖", "🦉", "🐙", "🐶", "🐼", "🐹", "🐷", "🐵", "🐴", "🐛", "🐞", "🐌", "🐝", "🐢", "🦑", "🦀", "🐡", "🦣", "🦌", "🦚", "🦫", "🦥", "🦔"]
    
    // type function
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }

    @Published private var model: MemoryGame<String> = createMemoryGame()

    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    // MARK: Intents
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
