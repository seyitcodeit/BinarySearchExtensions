//
//  ExtensionsStringProtocol.swift
//  fastcity_track
//
//  Created by Seyit on 08/03/21.
//

import Foundation

public extension StringProtocol {
    var initial: Character? {
        prefix(1)
            .folding(options: .diacriticInsensitive, locale: .enUSPOSIX)
            .uppercased()
            .first
    }

    func localizedStandardHasPrefix<S: StringProtocol>(_ string: S) -> Bool {
        prefix(string.count).localizedStandardContains(string)
    }
}
