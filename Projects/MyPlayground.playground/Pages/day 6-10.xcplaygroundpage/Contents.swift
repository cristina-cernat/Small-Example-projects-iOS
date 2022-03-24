import UIKit

    // DAY 6
// Closures 🤯 = functions used as a type (Functional programming)

// 1. Closures basic
// This creates a function without a name and assigns it to a variable
let driving = {
    print("im driving")
}

driving()


// 2. Closure with parameters - they go inside () and inside {...}
let driving2 = { (city: String) in
    print("im driving in \(city)")
}

// we don't use labels with closures!!!
driving2("Yassi")


// 3. Closure with return
let driving3 = { (city: String) -> String in
    return "im driving in \(city)"
}

let message = driving3("Comanesti")
print(message)


// 4. Closure as parameters
// rewatch video
func travel (action: () -> Void) {
    print("im traveling now, starting function ")
    action() // action will take different functions as input
    // TODO more examples needed
    print("no more traveling")
}
//
travel(action: driving)

// 5. Trailing closure ???
// same travel function
// can also be written as travel {...} bcs it has no params
travel() {
    print("Im traveling to nowhere i know 1")
}

    // DAY 6
// 6. Using closures as parameters when they accept parameters
func travel2 (action: (String) -> Void) {
    print("im traveling now, starting function ")
    action("Comanesti")
    print("no more traveling")
}

travel2 { (place: String) in
    print("Im traveling to \(place) 2")
}


// 7. Using closures as parameters when they return values
func travel3 (action: (String) -> String) {
    print("im traveling now, starting function ")
    action("Comanesti")
    print("no more traveling")
}

travel3 { (place: String) in
    return "Im traveling to \(place) 3"
}


// 8. Shorthand parameter names
func travel4 (action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description) // ???
    print("I arrived!")
}

//travel4 { (place: String) -> String in
//    return "Im traveling to \(place) 4"
//}

travel4 {
    "I'm going to \($0) in my car"
}


    // DAY 8
// Creating ur own types
// 1. Creating structs
struct Sport {
    //these are called roperties!!!
    var name: String
}

var tennis = Sport(name: "tennis")
print(tennis.name)
tennis.name = "lawn tennis"
print(tennis.name)

// 2. Computed properties

struct Sport2 {
    var name: String
    var isOlympicSport: Bool

    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is olympic sport"
        } else {
            return "\(name) is not olympic sport"
        }
    }
}

var chess = Sport2(name: "chess", isOlympicSport: false)
print(chess.olympicStatus)

// 3. Property observers
// they let u run code before or after any property changes

struct Progress {
    var task: String
    var time: Int {
        // property observer
        didSet {
            print("task is now \(time)")
        }
    }
}

var progress = Progress(task: "loading data", time: 0)
progress.time = 30
progress.time = 50
progress.time = 80
progress.time = 100


// 4. Methods
struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}
let comanesti = City(population: 20_000)
print(comanesti.collectTaxes())


// 5. Mutating methods
// methods that change the properties inside struct
struct Person {
    var name: String

    mutating func makeAnon() {
        name = "Anon"
    }
}

// here we cannot use let bcs that's how struct works ? i guess
var person1 = Person(name: "Ed")
person1.makeAnon()
print(person1.name)


// 6. String is a struct:
let myString = "do or do not. there's no try."
// string count
print(myString.count)
// prefix
print(myString.hasPrefix("do"))
// uppercase
print (myString.uppercased())
// sort
print(myString.sorted())


// 7. Arrays are struct

var toys = ["woody"]
print(toys.count)
toys.append("Allan")
toys.firstIndex(of: "Allan") // ???
print(toys.sorted())
toys.remove(at: 0)


    // DAY 9
// 1. Initializers

// 2. SELF
struct Language {
    var nameEnglish: String
    var nameLocal: String
    var speakerCount: Int
    init(english: String, local: String, speakerCount: Int) {
        self.nameEnglish = english
        self.nameLocal = local
        self.speakerCount = speakerCount
    }
}
let french = Language(english: "French", local: "francais", speakerCount: 800000)

