//
//  ViewController.swift
//  Concentration1
//
//  Created by Cristina Mihaela on 18.02.2022.
//

import UIKit

// Controller

class ViewController: UIViewController {


    private lazy var game = Concentration(numberOfPairs: numberOfPairs) // communicate with model

    // computed property - ok to get from outside, not ok to set, but the property is already get-only
    var numberOfPairs: Int {
        return (cardButtons.count + 1) / 2
    }

    @IBOutlet private weak var flipCountLabel: UILabel!

    @IBOutlet private weak var scoreLabel: UILabel!

    @IBOutlet private var cardButtons: [UIButton]!

    @IBOutlet private weak var newGameButton: UIButton!

    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            print("card number = \(cardNumber)")
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("card not found in cardButtons")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad() // must
        setTheme()
    }

    // New game
    @IBAction private func touchNewGame() {
        game = Concentration(numberOfPairs: (cardButtons.count + 1) / 2)
        setTheme()
        updateViewFromModel()

    }


    // Update
    private func updateViewFromModel() {
        for index in cardButtons.indices  {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(setEmoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? .clear : currentTheme.color
            }
        }

        flipCountLabel.text = "Flips: \(game.flipCount)"
        scoreLabel.text = "Score: \(game.score)"

    }


    // Theme
    private var currentTheme = Theme()

    private var emoji = [Int: String]()

    private func setEmoji(for card: Card) -> String {

        if emoji[card.identifier] == nil, currentTheme.emojiChoices.count > 0 {
            let randomIndex = currentTheme.emojiChoices.count.arc4random
            emoji[card.identifier] = currentTheme.emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }

    private var themeChoices : [Theme] = [
        Theme(color: .orange, emojiChoices: ["👻", "🎃", "🦇", "🍭", "🍬", "🙀", "🍎", "😈", "😱", "🤯"]),
        Theme(color: .green, emojiChoices: ["🌸", "🌼", "🌲", "🍄", "🍁", "🍊", "🍏", "🍑", "🍉", "🍒"]),
        Theme(color: .brown, emojiChoices: ["🐷", "🐱", "🐶", "🦊", "🐤", "🦀", "🦇", "🦭", "🐍", "🐬"]),
        Theme(color: .yellow, emojiChoices: ["🥰", "🥳", "😎", "😡", "🥶", "😵‍💫", "😂", "😇", "🥲", "😩"]),
        Theme(color: .blue, emojiChoices: ["🏀", "🎾", "🏈", "🎱", "⚽️", "🏸", "⛳️", "⛸", "🏹", "🪁"]),
        Theme(color: .cyan, emojiChoices: ["⌚️", "🖥", "📲", "⏰", "☎️", "💶", "📈", "📉", "✏️", "📌"])
    ]


    private func setTheme() {
        currentTheme = themeChoices.randomElement() ?? Theme()
        for button in cardButtons {
            button.backgroundColor = currentTheme.color
        }
        newGameButton.backgroundColor = currentTheme.color
        flipCountLabel.textColor = currentTheme.color
        scoreLabel.textColor = currentTheme.color
    }


}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
