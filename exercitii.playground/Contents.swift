import UIKit
import Foundation
import os

var greeting = "Hello, playground"

class MyClassA {


    // ! or ? the same here?
    weak var classCinA: MyClassC!

    deinit {
        print("clasa A - deinit")
    }
}

class MyClassB {
    weak var classAinB: MyClassA?

    init(classAinB: MyClassA) {
        self.classAinB = classAinB
    }
    deinit {
        print("clasa B - deinit")
    }
}

class MyClassC {
    weak var classBinC: MyClassB?

    init(classBinC: MyClassB) {
        self.classBinC = classBinC
    }

    deinit {
        print("clasa C - deinit")
    }
}


DispatchQueue.global().async {
    // MARK: cycle
    let classA = MyClassA()
    let classB = MyClassB(classAinB: classA)
    let classC = MyClassC(classBinC: classB)

    classA.classCinA = classC


    // MARK: Tuples

    let x: (String, Int, Double) = ("hello", 5, 9.8)
    let (word, int, double) = x // this names the tuple's elements when acsessing the tuple
    print(word, int, double)

    //let x: (s: String, i: Int, d: Double) = ("hello", 5, 9.8)
    //print(x.s, x.i, x.d)

    let (wrd, num, val) = x // this is legal: it renames the tuple's elements on access
    print(wrd, num, val)

    func getSize() -> (weight: Double, height: Double) { return (250, 80) }

    let size = getSize()
    print(size.weight)
    print(getSize().height)

    // MARK: Computed propertie
    var foo: Double {
        get {
            return 1
        }
        set(value) { // optional
            print("value is: \(value)")
        }
    }

    print(foo)

}

while true {
    sleep(10)
}
