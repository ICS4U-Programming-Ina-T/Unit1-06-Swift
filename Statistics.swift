//
// Statistics.swift
//
// Created by Ina Tolo
// Created on 2022-3-8
// Version 1.0
// Copyright (c) 2022 Ina Tolo. All rights reserved.
//
// The Statistics program implements an application that
// reads a text file into a list, converts it to an array,
// then calls different functions to determine the mean,
// median, and mode.

import Foundation

// function that calculates mean
func calcMean(arrayOfInts: [Int]) -> Double {
    let arrayLength: Double = Double(arrayOfInts.count)

    var sum: Int = 0

    // calculates mean
    for number in arrayOfInts {
        sum += number
    }

    let mean: Double = Double(sum) / arrayLength

    return mean
}

// function that calculates median
func calcMedian(arrayOfInts: [Int]) -> Double {
    let arrayLength: Int = arrayOfInts.count

    // sorts array
    let arrayOfInts = arrayOfInts.sorted()

    // declaring variables
    var median: Double = 0
    var firstMidNum: Int = 0
    var secondMidNum: Int = 0

    // calculates median
    if arrayLength % 2 == 0 {
        firstMidNum = arrayLength / 2
        secondMidNum = (arrayLength / 2) - 1
        median = Double((arrayOfInts[firstMidNum] + arrayOfInts[secondMidNum]) / 2)
    } else {
        firstMidNum = arrayLength / 2
        median = Double(arrayOfInts[firstMidNum])
    }

    return median
}

// function that calculates the mode
func calcMode(arrayOfInts: [Int]) -> [Int] {
    // declaring variables
    var counts = [Int: Int]()

    // finds mode
    arrayOfInts.forEach { counts[$0] = (counts[$0] ?? 0) + 1}
    let (_, count) = counts.max(by: {$0.1 < $1.1}) ?? (0, 0)
    var modes = counts.compactMap { $1 == count ? $0 : nil}

    // sorts modes
    modes.sort()

    return modes
}

// get text file
print("", terminator: " ")
let userSetChoice: String = readLine() ?? ""

// adds list values to array
let file: String = try String(contentsOfFile: userSetChoice)
let arrayOfString: [String] = file.components(separatedBy: "\n")
var arrayOfIntsFile: [Int] = arrayOfString.compactMap {Int($0)}

// function calls
let meanUser: Double = calcMean(arrayOfInts: arrayOfIntsFile)
let medianUser: Double = calcMedian(arrayOfInts: arrayOfIntsFile)
let modeUser: [Int] = calcMode(arrayOfInts: arrayOfIntsFile)

// displays mean, medium, and mode to the user
print(arrayOfIntsFile)
print("\nCalculating stats...")
print("The mean is: \(meanUser)")
print("The median is: \(medianUser)")
print("The mode(s) is/are: \(modeUser)")
