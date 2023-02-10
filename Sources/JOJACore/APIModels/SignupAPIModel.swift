//
//  SignupAPIModel.swift
//  
//
//  Created by Andrew on 2023/2/10.
//

import Foundation

public struct SignupAPIModel: Codable {
    public let username: String
    public let password: String
    
    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}

extension SignupAPIModel {
    public struct Create: Codable {
        public let username: String
        public let password: String
        
        public init(username: String, password: String) {
            self.username = username
            self.password = password
        }
    }
}
