//
//  ViewController.swift
//  Playing Card
//
//  Created by Cristina Mihaela on 01.03.2022.
//

import UIKit

// Controller

class ViewController: UIViewController {

    override func viewDidLoad() {

        var deck = PlayingCardDeck()

        for _ in 1...10 {
            if let card = deck.draw() {
                print("\(card)")
            }
        }
    }
}

