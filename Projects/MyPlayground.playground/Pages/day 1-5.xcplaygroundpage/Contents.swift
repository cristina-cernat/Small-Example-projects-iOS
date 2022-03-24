import UIKit


    // DAY 1

var str = "Hello, "

print(str)

var age = 24
var population = 8_000_000
var multi = """
yee
noo
"""
var multii = """
yee\
noo
"""

var booleann = true
// string interpolation: (U can actually run code inside here)
var str_age = "ur age is \(age)"

// constants. use them unless u specifically want to change the value
let pi = 3.141

//Type annotation: String, Int, Bool, Double (Explicit types
let album: String = "my album"


    // DAY 2

let name = "Cris"
str = "Hello, \(name)"
// Arrays
let final = [str, str_age]
//read item from array
final[1]

// Sets
let colors = Set(["red", "green", "blue"])

// Tuples
let tuple = (first: "kris", last:"cernat")
tuple.0
tuple.first

// Dictionary
let dict = [
    "key": "value",
    "age": "twenty four"
]
dict["age"]
dict["hobby", default: "no hobby"]

// All these (arrays, sets, tuples and dicts) are collections()
var my_array = [Int]()

// Create empty collections
var dict1 = [String: String]() // 1 special way
var dict2:[String: String] = [:] // 2 type annotation
var dict3 = Dictionary<String, Int>() // 3 classic way

var array1 = [Int]() // 1 special way
var array2:[Int] = [] // 2 Type annotation
var array3 = Array<Int>() // 3 Classic

// Enum
enum Result {
    case success
    case failure
}

let enum_result = Result.failure

// Enum associated values
enum Activity {
    case bored(time_in_minutes: Int)
    case talking(topic: String)
    case running(destination: String)
}

let talking = Activity.talking(topic: "food")


    // DAY 3

// Operators: + - * / %
let res_operator = 5 % 4

// Operator overloading: operator depends on the type

let overload1 = ["name", " is"]
let overload2 = overload1 + ["Philip"] + ["Carvel"]
let overload3 = "Philip" + " Carvel" + "  is here"

// Shorthand operators
var shorthand1 = 1
shorthand1 -= 1

var shorthand2 = "Philip "
shorthand2 += "Carvel"


// Comparisons
let comparison1 = 4
let comparison2 = 6

comparison1 == comparison2 // ==, !=, >, <, >=, <=

"A" > "B"

// IF condition
let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 21 {
    print("Blackjack!")
} else if firstCard + secondCard == 2 {
    print("luckyy")
} else {
    print("no blackjack :(")
}

// Combine conditions: && ||

// Ternary operator
print (firstCard == secondCard ? "same cards" : "different")

// Switch statements
let weather = "sunny"
switch weather {
case "rainy":
    print("Bring umbrella")
case "snow":
    print("wrap up warm")
case "sunny":
    print("nice")
    fallthrough // continute and do the next anyway
default:
    print("enjoy ur day")
}

// Range operators: ..< ...
let score = 85

switch score {
case 0..<50:
    print("bad")
case 50...85:
    print("good")
default:
    print("great!!")

}

    // DAY 4
//For loops
let four = 1...4

// Use _ for any unused variables
for _ in four {
    print("number")
}

// While loops

var i = 1
while i <= 20
{
    print(i)
    i += 1
}
print("ready or not")

// Repeat loops ~ Do..while
repeat {
    print("this is false")
} while false


// Exiting loops - Break
var countdown = 10

while countdown >= 0 {
    print(countdown)

    if countdown == 4 {
        print("im bored bro")
        break //here we break
    }

    countdown -= 1

}
print("rocket launch")

// Exiting nested loops

outerloop: for i in 1...10 { // here label is outerloop
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) = \(product)")

        if product == 50 {
            print("ooooo")
            break outerloop //here we use outerloop label
        }
    }
}

// Skipping items
// example skip odd numbers
var iii = 90
// Q: is the outer iii used here???
for iii in 1...10 {

    if iii % 2 == 1 {
        continue // here we skip and we print only even numbers
    }
    print(iii)

}
// A: no, it's not
print(iii)


// Infinite loops! Exit your loops!
var seconds = 0
while true {
    print("waiting...")
    seconds += 1

    if seconds == 4 {
        break
    }

}

    // DAY 5

// Functions
func printHelp() {
    let message = """
what a great function!
wow
"""
    print(message)
}

printHelp()

// Accepting custom parameters
func square(number: Int) {
    print(number * number)
}

square(number: 8)


// Returning functions
func square2(num: Int) -> (Int, Int) {
    // U can return Tuples! example:
    return (num * num, 3)
}


print(square2(num: 6))


// Parameter labels
// 1. outer laber (to:)
// 2. inner label (name:))
func sayHello(to name: String) {
    print("Hello, \(name)")
}

sayHello(to: "Criss")


func sayHi(_ person: String) { // if u want to avoid typing a parameter, use _
    print("Hi, \(person)")
}

func sayHi(_ to: String, _ andWelcomeMessage: String) {
    print("Hi, \(to), \(andWelcomeMessage)")
}

sayHi("Philip")
sayHi("Marcel", "bine ai venit!")

// Labels are good if you call setAlarm(5)
// - is it alarm for 5 o'clok?
// - is it alarm for 5h from now??
// - is it alarm number 5 from the list of alarms?

// Default parameters
func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hi dear, \(person)")
    }
    else {
        print("go away, \(person)")
    }
}

greet("Cris")
greet("Philip", nicely: false)


// Variatic functions - variable number of params (of the same type)
func square3(numbers: Int...) {
    for number in numbers {
        // Example fo how to use terminator in print (separator)
        print(number * number, terminator: ", ")
    }
}

square3(numbers: 1, 2, 3)


// Writing throwing functions
// First we use an Enum to describe the errors we use
enum PasswordError : Error {
    case obviousPassword
}

// "throws" keyword in the declaration
// "throw" keyword when bad happens
func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obviousPassword
    }
    return true
}

print(" ", terminator: "\n")

// Running throwing functions
do {
    try checkPassword("password")
    print("good password")
} catch {
        print("bad password")
}

//try! checkPassword("password")


// Inout functions - variable parameter
func doubleTheNumber(number: inout Int) {
    number *= 2
}

// calling functions with *inout* parameters, use &
var a = 4
doubleTheNumber(number: &a)

