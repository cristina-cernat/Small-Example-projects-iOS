//
//  Card.swift
//  Concentration1
//
//  Created by Cristina Mihaela on 21.02.2022.
//

import Foundation
// Model

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int

    var isSeen = false

    private static var identifierFactory = 0

    private static func getUniqueIdentifier () -> Int {
        identifierFactory += 1
        return identifierFactory
    }

    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
