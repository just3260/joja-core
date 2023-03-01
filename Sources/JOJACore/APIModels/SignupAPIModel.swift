//
//  SignupAPIModel.swift
//  
//
//  Created by Andrew on 2023/2/10.
//

import Foundation

public struct SignupAPIModel: Codable {
    public let username: String
    public let email: String
    public let password: String
    
    public init(username: String, email: String, password: String) {
        self.username = username
        self.email = email
        self.password = password
    }
}
