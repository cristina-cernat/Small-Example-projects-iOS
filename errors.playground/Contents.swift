//
//  errors.swift
//  Concentration1
//
//  Created by Cristina Mihaela on 22.02.2022.
//

import Foundation

enum FindResult {
    case found(Int)
    case notFound
}

func findInedx(array: [Int], element: Int) -> FindResult {
    for index in 0..<array.count
    {
        if array[index] == element {
            return FindResult.found(index)
        }
    }
    return FindResult.notFound

}

var x = findInedx(array: [2, 3, 4, 5], element: 3)

switch x {
case .found(let result) :
    print("found: \(result)")
case .notFound:
    print("not found")
}

enum Car {
    case audi(color: String, power: Int)
    case dacia(color: String, power: Int)
}

//var car = Car.audi(color: <#T##String#>, power: <#T##Int#>)

if 2%2==0, 3%2==1
{
    print("conditie adevarata")
}

var number: Int? = 4

if let safeNumber = number, safeNumber%2==0 {
    print(true)
}
else {
    print("nu exista, sau nu e par")
}


var y: Int = 70000
//var z: Int16 = Int16(y) // ca sa anunte programatoru ca hei e o operatie cam nesigura, si apoi mna poti face cast


print(arc4random_uniform(8))

var q: Int = Int.random(in: 0...9)
print(q)


///
///
///
// build range with only capatul din dreapta
// init in init
struct MyRange {
    let left: Int
    let right: Int

    private init(left: Int, right: Int) {
        self.left = left
        self.right = right

    }

    init (right: Int) {
        self.init(left: 0, right: right)
    }
}

let mtRange = MyRange(right: 6)



// CLOSURES
func myFunc(action: (Int) -> Bool) {

}

var action = { (index: Int) ->  Bool in
    return true
}

var arrayy = { (arr: [Int], act: (_ int: Int) -> Bool) -> [Int] in
    return [1]
}
// type alias 9sus deasupra funtiilor ca untypedef

typealias MyInt = Int
var aa: MyInt
var bb: Int = 13
aa = bb
bb = aa


typealias Closure = (_ int: Int) -> Bool

//so now:

var arrayy2 = { (arr: [Int], act: Closure) -> [Int] in
    return [1]
}


// filter array
var array = [2, 4, 5, 6, 7]

typealias Filter = (_ array: [Int]) -> [Int]

//var even = { (_ array: [Int]) -> [Int] in
//    var res: [Int] = []
//    for value in array {
//        if(value % 2 == 0) {
//            res.append(value)
//        }
//    }
//    return res
//}

//
var odd = { (_ array: [Int]) -> [Int] in
    var res: [Int] = []
    for value in array {
        if(value % 2 == 1) {
            res.append(value)
        }
    }
    return res
}

var action3 = { (_ array: [Int], _ triple: Closure) -> [Int] in
    var res: [Int] = []
    for value in array {
        if(triple(value)) {
            res.append(value)
        }
    }
    return res
}

var positive = { (_ array: [Int]) -> [Int] in
    var res: [Int] = []
    for value in array {
        if(value > 0) { // if(action(value)) {...}
            res.append(value)
        }
    }
    return res
}

var triple = { (_ value: Int) -> Bool in
    if(value % 3 == 0) {
        return true
    } else {
        return false
    }

}

var process = { (array: [Int], actionFilter: Filter) -> [Int] in

    return actionFilter(array)
}

//process(array, even)
//process(array, odd)
//process(array, threeMultiple)
print(action3(array, triple))

print(action3(array, { (_ value: Int) -> Bool in
    if value < 5 {
        return true
    } else {
        return false
    }
}))
// iei o val si tu ii dai codu
