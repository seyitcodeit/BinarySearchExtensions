//
//  ExtensionsURL.swift
//  fastcity_track
//
//  Created by Seyit on 05/03/21.
//

import Foundation

public extension URL {
    func data(options: NSData.ReadingOptions = [.mappedIfSafe]) throws -> Data {
        try Data(contentsOf: self, options: options)
    }
}


