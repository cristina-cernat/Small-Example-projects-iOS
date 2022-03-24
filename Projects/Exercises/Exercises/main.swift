//
//  main.swift
//  Exercises
//
//  Created by Cristina Mihaela on 23.02.2022.
//

import Foundation

func mySqrt(_ x: Double) -> Double { return x * x }
var operation: (Double) -> Double

// A minor syntactic change: Move the first { to the start and replace with in

operation = { (_ x: Double) -> Double in return x * x }

let result = operation(4.0)

print(result)

