//
//  TokenAPIModel.swift
//  
//
//  Created by Andrew on 2023/2/7.
//

import Foundation

public enum SessionSource: Int, Codable {
    case signup
    case login
}

public struct TokenAPIModel: Codable {
    public let id: UUID
    public let user: UserAPIModel
    public let value: String
    public let source: SessionSource
    public let createdAt: Date
    public let updatedAt: Date
    
    public init(id: UUID, user: UserAPIModel, value: String, source: SessionSource, createdAt: Date, updatedAt: Date) {
        self.id = id
        self.user = user
        self.value = value
        self.source = source
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

extension TokenAPIModel {
    public struct Create: Codable {
        public let user: UserAPIModel
        public let value: String
        public let source: SessionSource
        
        public init(user: UserAPIModel, value: String, source: SessionSource) {
            self.user = user
            self.value = value
            self.source = source
        }
    }
}
