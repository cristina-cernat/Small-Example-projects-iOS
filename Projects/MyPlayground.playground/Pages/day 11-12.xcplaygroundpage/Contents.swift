import UIKit

// 1. basic protocol
protocol Purchaseable {
    // this can be read (get) or written (set)
    var name: String { get set }
}

struct Book: Purchaseable {
    var name: String
    var author: String
}

struct Game: Purchaseable {
    var name: String
    var genre = "common"

}

var game = Game(name: "Vidya")

func displayName(_ thing: Purchaseable) {
    print(thing.name)
}

displayName(game)

// 2. protocol inheritance
protocol Product {
    var name: String { get set }
    var price: Double { get set }
}

protocol Computer: Protocol {
    var cpu: String { get set }
}


// 3. Extensions
extension Int {
    func squared() -> Int {
        return self * self
    }
}

let num = 8
num.squared()
// it doesn't modify the num, it's just a function that returns the square of num <3 woah
print(num)


// 4. Protocol extensions
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"] // array
let beatles = Set(["John", "Paul", "George", "Ringo"]) // set

extension Collection {
    func printing() {
        print("there is \(self.count) of us:")

        for name in self {
            print(name)
        }
    }
}

pythons.printing()
beatles.printing()
