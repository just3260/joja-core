
import Foundation

public struct TradeAPIModel: Codable {
    
    public let id: UUID
    public let goods: String
    public let types: TypeAPIModel.Goods
    public let amount: Int
    public let note: String?
    public let buyerID: UUID
    public let createdAt: Date?
    
    public init(
        id: UUID,
        goods: String,
        types: TypeAPIModel.Goods,
        amount: Int,
        note: String?,
        buyerID: UUID,
        createdAt: Date?
    ) {
        self.id = id
        self.goods = goods
        self.types = types
        self.amount = amount
        self.note = note
        self.buyerID = buyerID
        self.createdAt = createdAt
    }
}

extension TradeAPIModel {
    public struct Request: Codable {
        public let goods: String
        public let types: TypeAPIModel.Goods
        public let amount: Int
        public let note: String?
        public let buyerID: UUID
        
        public init(
            goods: String,
            types: TypeAPIModel.Goods,
            amount: Int,
            note: String?,
            buyerID: UUID
        ) {
            self.goods = goods
            self.types = types
            self.amount = amount
            self.note = note
            self.buyerID = buyerID
        }
    }
}

extension TradeAPIModel {
    public struct Response: Codable {
        public let id: UUID
        public let goods: String
        public let types: TypeAPIModel.Goods
        public let amount: Int
        public let note: String?
        public let buyerID: UUID
        public let createdAt: Date?
        
        public init(
            id: UUID,
            goods: String,
            types: TypeAPIModel.Goods,
            amount: Int,
            note: String?,
            buyerID: UUID,
            createdAt: Date?
        ) {
            self.id = id
            self.goods = goods
            self.types = types
            self.amount = amount
            self.note = note
            self.buyerID = buyerID
            self.createdAt = createdAt
        }
    }
}
