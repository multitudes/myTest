//
//  Sequence.swift
//  Terminal
//
//  Created by Paul Hudson on 20/02/2020.
//  Copyright © 2020 Hacking with Swift. All rights reserved.
//

import Foundation

@available(macOS 10.15, *)
extension Sequence where Element: Hashable {
    func unique() -> [Element] {
        var checked = Set<Element>()
        var result = [Element]()

        for item in self {
            if checked.contains(item) == false {
                checked.insert(item)
                result.append(item)
            }
        }

        return result
    }
}

@available(macOS 10.15, *)
extension Sequence where Element: Equatable {
    func indexes(of searchItem: Element) -> [Int] {
        var returnValue = [Int]()

        for (index, item) in self.enumerated() {
            if item == searchItem {
                returnValue.append(index)
            }
        }

        return returnValue
    }
}

@available(macOS 10.15, *)
extension Sequence {
    func any(match predicate: (Element) throws -> Bool) rethrows -> Bool {
        try contains(where: predicate)
    }

    func none(match predicate: (Element) throws -> Bool) rethrows -> Bool {
        try !contains(where: predicate)
    }

    func random(_ num: Int) -> [Element] {
        Array(shuffled().prefix(num))
    }
}
