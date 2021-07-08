//
//  ExtensionsCharacter.swift
//  fastcity_track
//
//  Created by Seyit on 07/03/21.
//

import Foundation

public extension Character {
    var index: Int { "A"..."Z" ~= self ? Int(unicodeScalars.first!.value)-65 : 26 }
}
