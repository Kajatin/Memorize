//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Roland Kajatin on 06/11/2021.
//

import SwiftUI

class EmojiMemoryGame {
    // type variable
    static let emojis = ["🐳", "🦖", "🦉", "🐙", "🐶", "🐼", "🐹", "🐷", "🐵", "🐴", "🐛", "🐞", "🐌", "🐝", "🐢", "🦑", "🦀", "🐡", "🦣", "🦌", "🦚", "🦫", "🦥", "🦔"]
    
    // type function
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }

    private var model: MemoryGame<String> = createMemoryGame()

    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
}
