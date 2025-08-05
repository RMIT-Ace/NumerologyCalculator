//
//  Numerology.swift
//  Numerology Calculator
//
//  Created by Ace on 26/7/2025.
//

/// Calculate numerology number from a given series of integer numbers.
public func calculateNumeroNumber(_ digits: [Int], reduceMasterNumber: Bool = false) -> Int {
    let result = digits.reduce(0, +)
    let shouldReduceResult: Bool = (
        ((result > 9) && !isMasterNumber(result)) ||
        ((result > 9) && isMasterNumber(result) && reduceMasterNumber)
    )
    if shouldReduceResult {
        return calculateNumeroNumber(numberToDigits(result), reduceMasterNumber: shouldReduceResult)
    } else {
        return result
    }
}

public func numberToDigits(_ number: Int) -> [Int] {
    var digits: [Int] = []
    var num = number
    
    repeat {
        let digit = num % 10
        digits.append(digit)
        num /= 10
    } while num != 0
    return digits.reversed()
}

private let masterNumbers: Set<Int> = [ 11, 22, 33 ]

public func isMasterNumber(_ number: Int) -> Bool {
    return masterNumbers.contains(number)
}

