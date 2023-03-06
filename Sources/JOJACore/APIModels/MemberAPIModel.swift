
import Foundation

public struct MemberAPIModel: Codable {
    
    public let id: UUID
    public let name: String
    public let phone: String
    public let birthday: Date?
    public let from: TypeAPIModel.WhereToKnow
    public let address: String?
    public let email: String?
    public let note: String?
    public let amount: Int
    public let isVip: Bool
    public let createdAt: Date?
    public let updatedAt: Date?
    public let trades: [TradeAPIModel]?
    
    public init(
        id: UUID,
        name: String,
        phone: String,
        birthday: Date?,
        from: TypeAPIModel.WhereToKnow,
        address: String?,
        email: String?,
        note: String?,
        amount: Int,
        isVip: Bool,
        createdAt: Date?,
        updatedAt: Date?,
        trades: [TradeAPIModel]?
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
        self.trades = trades
    }
}

extension MemberAPIModel {
    public struct Request: Codable {
        public let name: String
        public let phone: String
        public let birthday: Date?
        public let from: TypeAPIModel.WhereToKnow
        public let address: String?
        public let email: String?
        public let note: String?
        
        public init(
            name: String,
            phone: String,
            birthday: Date?,
            from: TypeAPIModel.WhereToKnow,
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
    public struct Response: Codable {
        public let id: UUID
        public let name: String
        public let phone: String
        public let birthday: Date?
        public let from: TypeAPIModel.WhereToKnow
        public let address: String?
        public let email: String?
        public let note: String?
        public let amount: Int
        public let isVip: Bool
        public let createdAt: Date?
        public let updatedAt: Date?
        public let trades: [TradeAPIModel.Response]?
        
        public init(
            id: UUID,
            name: String,
            phone: String,
            birthday: Date?,
            from: TypeAPIModel.WhereToKnow,
            address: String?,
            email: String?,
            note: String?,
            amount: Int,
            isVip: Bool,
            createdAt: Date?,
            updatedAt: Date?,
            trades: [TradeAPIModel.Response]?
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
            self.trades = trades
        }
    }
}

extension MemberAPIModel {
    public struct ListData: Codable {
        public let id: UUID
        public let name: String
        public let phone: String
        public let amount: Int
        public let isVip: Bool
        public let createdAt: Date?
        
        public init(
            id: UUID,
            name: String,
            phone: String,
            amount: Int,
            isVip: Bool,
            createdAt: Date?
        ) {
            self.id = id
            self.name = name
            self.phone = phone
            self.amount = amount
            self.isVip = isVip
            self.createdAt = createdAt
        }
    }
}
