//
//  UserAPIModel.swift
//  
//
//  Created by Andrew on 2023/2/7.
//

import Foundation

public struct UserAPIModel: Codable {
    public let id: UUID
    public let username: String
    public let password: String
    public let createdAt: Date
    public let updatedAt: Date
    
    public init(id: UUID, username: String, password: String, createdAt: Date, updatedAt: Date) {
        self.id = id
        self.username = username
        self.password = password
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

extension UserAPIModel {
    public struct Create: Codable {
        public let username: String
        public let password: String
        
        public init(username: String, password: String) {
            self.username = username
            self.password = password
        }
        
        public init(signup: SignupAPIModel) {
            self.username = signup.username
            self.password = signup.password
        }
    }
}

extension UserAPIModel {
    public struct Public: Codable {
        public let id: UUID
        public let username: String
        public let createdAt: Date
        public let updatedAt: Date
        
        public init(id: UUID, username: String, createdAt: Date, updatedAt: Date) {
            self.id = id
            self.username = username
            self.createdAt = createdAt
            self.updatedAt = updatedAt
        }
    }
}
