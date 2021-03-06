//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Roland Kajatin on 06/11/2021.
//

import SwiftUI

class EmojiMemoryGame {
    // type variable
    static let emojis = ["đŗ", "đĻ", "đĻ", "đ", "đļ", "đŧ", "đš", "đˇ", "đĩ", "đ´", "đ", "đ", "đ", "đ", "đĸ", "đĻ", "đĻ", "đĄ", "đĻŖ", "đĻ", "đĻ", "đĻĢ", "đĻĨ", "đĻ"]
    
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
