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
    public let email: String
    public let isAdmin: Bool
    public let password: String
    public let createdAt: Date
    public let updatedAt: Date
    
    public init(id: UUID, username: String, email: String, password: String, isAdmin: Bool, createdAt: Date, updatedAt: Date) {
        self.id = id
        self.username = username
        self.email = email
        self.password = password
        self.isAdmin = isAdmin
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

extension UserAPIModel {
    public struct Create: Codable {
        public let username: String
        public let email: String
        public let password: String
        
        public init(username: String, email: String, password: String) {
            self.username = username
            self.email = email
            self.password = password
        }
        
        public init(signup: SignupAPIModel) {
            self.username = signup.username
            self.email = signup.email
            self.password = signup.password
        }
    }
}

extension UserAPIModel {
    public struct Public: Codable {
        public let id: UUID
        public let username: String
        public let email: String
        public let isAdmin: Bool
        public let createdAt: Date
        public let updatedAt: Date
        
        public init(id: UUID, username: String, email: String, isAdmin: Bool, createdAt: Date, updatedAt: Date) {
            self.id = id
            self.username = username
            self.email = email
            self.isAdmin = isAdmin
            self.createdAt = createdAt
            self.updatedAt = updatedAt
        }
    }
}
