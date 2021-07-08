//
//  ExtensionsRandomAccessCollection.swift
//  fastcity_track
//
//  Created by Seyit on 07/03/21.
//

import Foundation


public extension RandomAccessCollection where Index == Int {
    /// Returns the first index of the collection that has a given prefix diacritic and case insensitive
    /// It is assumed that the collection elements are sorted in ascending (non-decreasing) order.
    ///
    /// - Parameters
    ///              predicate: The predicate to return the property of the element.
    ///              prefix: The string to search.
    /// - Returns: `true` if the element was found in the collection; otherwise,
    ///   `false`.
    ///
    /// - Complexity: O(log(*n*)), where *n* is the size of the collection.
    func binarySearchFirstIndexHasPrefix<T: StringProtocol>(where predicate: (Element) -> T, prefix: T) -> Index? {
        guard !isEmpty else { return nil }
        var index = self.index(startIndex, offsetBy: count / 2)
        if predicate(self[index]).localizedStandardHasPrefix(prefix) {
            while index > startIndex, predicate(self[index-1]).localizedStandardHasPrefix(prefix) { index -= 1 }
            return index
        } else if predicate(self[index]).localizedCompare(prefix) == .orderedDescending {
            return self[..<index].binarySearchFirstIndexHasPrefix(where: predicate, prefix: prefix)
        } else {
            return self[self.index(after: index)...].binarySearchFirstIndexHasPrefix(where: predicate, prefix: prefix)
        }
    }
    /// Returns the last index of the collection that has a given prefix diacritic and case insensitive
    /// It is assumed that the collection elements are sorted in ascending (non-decreasing) order.
    ///
    /// - Parameters
    ///              predicate: The predicate to return the property of the element.
    ///              prefix: The string to search.
    /// - Returns: `true` if the element was found in the collection; otherwise,
    ///   `false`.
    ///
    /// - Complexity: O(log(*n*)), where *n* is the size of the collection.
    func binarySearchLastIndexHasPrefix<T: StringProtocol>(where predicate: (Element) -> T, prefix: T) -> Index? {
        guard !isEmpty else { return nil }
        var index = self.index(startIndex, offsetBy: count / 2)
        if predicate(self[index]).localizedStandardHasPrefix(prefix) {
            while index < endIndex-1, predicate(self[index+1]).localizedStandardHasPrefix(prefix) { index += 1 }
            return index
        } else if predicate(self[index]).localizedCompare(prefix) == .orderedDescending {
            return self[..<index].binarySearchLastIndexHasPrefix(where: predicate, prefix: prefix)
        } else {
            return self[self.index(after: index)...].binarySearchLastIndexHasPrefix(where: predicate, prefix: prefix)
        }
    }
}
