//
//  File.swift
//  
//
//  Created by Andrew on 2023/2/22.
//

import Foundation

public struct MemberAPIModel: Codable {
    
    public enum FromType: Int, Codable {
        case passBy // 路過
        case fb // Facebook
        case ig // Instagram
        case market // 市集
        case search // 網路搜尋
        case friend // 親友介紹
        case pinkoi // Pinkoi
        case eslite // 誠品
        case qsquare // 京站
        case jccac // JCCAC - 香港賽馬協會
        case goyound // 古漾
        case treasureHill // 寶藏巖國際藝術村
        case consignmentShop // 寄賣店
    }
    
    public let id: UUID
    public let name: String
    public let phone: String
    public let birthday: Date?
    public let from: FromType
    public let address: String?
    public let email: String?
    public let note: String?
    public let amount: Int
    public let isVip: Bool
    public let createdAt: Date?
    public let updatedAt: Date?
    
    public init(
        id: UUID,
        name: String,
        phone: String,
        birthday: Date?,
        from: FromType,
        address: String?,
        email: String?,
        note: String?,
        amount: Int,
        isVip: Bool,
        createdAt: Date?,
        updatedAt: Date?
    ) {
        self.id = id
        self.name = name
        self.phone = phone
        self.birthday = birthday
        self.from = from
        self.address = address
        self.email = email
        self.note = note
        self.amount = amount
        self.isVip = isVip
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

extension MemberAPIModel {
    public struct Create: Codable {
        public let name: String
        public let phone: String
        public let birthday: Date?
        public let from: FromType
        public let address: String?
        public let email: String?
        public let note: String?
        
        public init(
            name: String,
            phone: String,
            birthday: Date?,
            from: FromType,
            address: String?,
            email: String?,
            note: String?
        ) {
            self.name = name
            self.phone = phone
            self.birthday = birthday
            self.from = from
            self.address = address
            self.email = email
            self.note = note
        }
    }
}

extension MemberAPIModel {
    public struct Public: Codable {
        public let id: UUID
        public let name: String
        public let phone: String
        public let birthday: Date
        public let from: FromType
        public let address: String
        public let email: String
        public let note: String
        public let amount: Int
        public let isVip: Bool
        public let createdAt: Date
        public let updatedAt: Date
        
        public init(
            id: UUID,
            name: String,
            phone: String,
            birthday: Date,
            from: FromType,
            address: String,
            email: String,
            note: String,
            amount: Int,
            isVip: Bool,
            createdAt: Date,
            updatedAt: Date
        ) {
            self.id = id
            self.name = name
            self.phone = phone
            self.birthday = birthday
            self.from = from
            self.address = address
            self.email = email
            self.note = note
            self.amount = amount
            self.isVip = isVip
            self.createdAt = createdAt
            self.updatedAt = updatedAt
        }
    }
}