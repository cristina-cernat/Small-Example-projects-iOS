//
//  Concentration.swift
//  Concentration1
//
//  Created by Cristina Mihaela on 21.02.2022.
//

import Foundation
// Model

struct Concentration {

    var cards = [Card]()

    // MARK: Computed property
    private(set) var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil { // haven't found cards yet
                        foundIndex = index
                    } else { // 2nd found card
                        return nil
                    }
                }

            }
            return foundIndex
        }

        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue) // true only if index == indexOfOneAndOnlyFaceUpCard card
            }
        }
    }

    var flipCount = 0

    var score = 0

    var seenCards: [Int] = []

    mutating func chooseCard(at index: Int) { // index = btn sender index
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            flipCount += 1
            // if 1 card up:
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match:
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true

                    score += 2
                } else {
                    if cards[index].isSeen == true {
                        score -= 1
                    }
                }

                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
                // MARK: is seen
                cards[index].isSeen = true
            }
        }
    }


    init(numberOfPairs: Int) {
        assert(numberOfPairs > 0, "Concentration.init(\(numberOfPairs)): you must provide at least one pair of cards")
        for _ in 0..<numberOfPairs {
            let card = Card()
            cards += [card, card]
        }
        cards = cards.shuffled()
        flipCount = 0
        score = 0
    }
}
