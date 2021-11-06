//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Roland Kajatin on 04/11/2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
