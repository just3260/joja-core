//
//  SessionAPIModel.swift
//  
//
//  Created by Andrew on 2023/2/13.
//

import Foundation

public struct SessionAPIModel: Codable {
    public let token: String
    public let user: UserAPIModel.Public
    
    public init(token: String, user: UserAPIModel.Public) {
        self.token = token
        self.user = user
    }
}
