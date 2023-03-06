
import Foundation

public struct TradeAPIModel: Codable {
    
    public let id: UUID
    public let goods: [GoodsAPIModel]
    public let amount: Int
    public let note: String?
    public let buyerID: UUID
    public let createdAt: Date?
    
    public init(
        id: UUID,
        goods: [GoodsAPIModel],
        amount: Int,
        note: String?,
        buyerID: UUID,
        createdAt: Date?
    ) {
        self.id = id
        self.goods = goods
        self.amount = amount
        self.note = note
        self.buyerID = buyerID
        self.createdAt = createdAt
    }
}

extension TradeAPIModel {
    public struct Request: Codable {
        public let goods: [GoodsAPIModel.Request]
        public let amount: Int
        public let note: String?
        public let buyerID: UUID
        
        public init(
            goods: [GoodsAPIModel.Request],
            amount: Int,
            note: String?,
            buyerID: UUID
        ) {
            self.goods = goods
            self.amount = amount
            self.note = note
            self.buyerID = buyerID
        }
    }
}

extension TradeAPIModel {
    public struct Response: Codable {
        public let id: UUID
        public let goods: [GoodsAPIModel.Response]
        public let amount: Int
        public let note: String?
        public let buyerID: UUID
        public let createdAt: Date?
        
        public init(
            id: UUID,
            goods: [GoodsAPIModel.Response],
            amount: Int,
            note: String?,
            buyerID: UUID,
            createdAt: Date?
        ) {
            self.id = id
            self.goods = goods
            self.amount = amount
            self.note = note
            self.buyerID = buyerID
            self.createdAt = createdAt
        }
    }
}
