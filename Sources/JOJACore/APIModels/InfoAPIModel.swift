//
//  File.swift
//  
//
//  Created by Andrew on 2023/12/20.
//

import Foundation

public struct InfoAPIModel: Codable, Hashable {
    public let version: String
    
    public init(version: String) {
        self.version = version
    }
}
