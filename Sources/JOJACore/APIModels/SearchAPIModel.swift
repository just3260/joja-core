//
//  File.swift
//  
//
//  Created by Andrew on 2024/1/10.
//

import Foundation

public struct SearchAPIModel: Codable, Hashable {
    public let key: String
    public let type: [TypeAPIModel.SearchType]
    public let matchAll: Bool
    
    public init(key: String, type: [TypeAPIModel.SearchType] = [.phone], matchAll: Bool = false) {
        self.key = key
        self.type = type
        self.matchAll = matchAll
    }
}
