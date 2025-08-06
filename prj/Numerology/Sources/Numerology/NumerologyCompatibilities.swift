//
//  NumerologyCompatibilities.swift
//  Numerology
//
//  Created by Ace on 5/8/2025.
//

public struct Compatibility: Sendable {
    public var friends: [Int] = []
    public var foes: [Int] = []
    
    public init(friends: [Int] = [], foes: [Int] = []) {
        self.friends = friends
        self.foes = foes
    }
}

public let numberCompatibilities: [Int: Compatibility] = [
    0: Compatibility(friends: [], foes: []),
    1: Compatibility(friends: [1, 5, 7], foes: [4, 6]),
    2: Compatibility(friends: [2, 4, 8], foes: [5, 7]),
    3: Compatibility(friends: [3, 6, 9], foes: [4, 7, 8]),
    4: Compatibility(friends: [2, 4, 8], foes: [1, 3, 5, 9]),
    5: Compatibility(friends: [1, 5, 7], foes: [2, 4, 6]),
    6: Compatibility(friends: [3, 6, 9], foes: [1, 5, 7]),
    7: Compatibility(friends: [1, 5, 7], foes: [2, 3, 6, 8, 9]),
    8: Compatibility(friends: [2, 4, 8], foes: [3, 7, 9]),
    9: Compatibility(friends: [3, 6, 9], foes: [4, 7, 8]),
]
