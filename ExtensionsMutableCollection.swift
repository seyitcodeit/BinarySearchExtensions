//
//  ExtensionsMutableCollection.swift
//  fastcity_track
//
//  Created by Seyit on 07/03/21.
//

import Foundation

public extension MutableCollection where Self: RandomAccessCollection {
    mutating func localizedStandardSort<T: StringProtocol>(_ predicate: (Element) -> T, ascending: Bool = true) {
        sort {
            predicate($0).localizedStandardCompare(predicate($1)) ==
                (ascending ? .orderedAscending : .orderedDescending)
        }
    }
}
