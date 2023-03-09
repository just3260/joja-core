
import Foundation

public struct TradeAPIModel: Codable, Hashable {
    
    public let id: UUID
    public let products: [ProductAPIModel]
    public let amount: Int
    public let note: String?
    public let buyerID: UUID
    public let createdAt: Date?
    
    public init(
        id: UUID,
        products: [ProductAPIModel],
        amount: Int,
        note: String?,
        buyerID: UUID,
        createdAt: Date?
    ) {
        self.id = id
        self.products = products
        self.amount = amount
        self.note = note
        self.buyerID = buyerID
        self.createdAt = createdAt
    }
}

extension TradeAPIModel {
    public struct Request: Codable, Hashable {
        public let products: [ProductAPIModel.Request]
        public let note: String?
        public let buyerID: UUID
        
        public init(
            products: [ProductAPIModel.Request],
            note: String?,
            buyerID: UUID
        ) {
            self.products = products
            self.note = note
            self.buyerID = buyerID
        }
    }
}

extension TradeAPIModel {
    public struct Response: Codable, Hashable {
        public let id: UUID
        public let products: [ProductAPIModel.Response]
        public let amount: Int
        public let note: String?
        public let buyerID: UUID
        public let createdAt: Date?
        
        public init(
            id: UUID,
            products: [ProductAPIModel.Response],
            amount: Int,
            note: String?,
            buyerID: UUID,
            createdAt: Date?
        ) {
            self.id = id
            self.products = products
            self.amount = amount
            self.note = note
            self.buyerID = buyerID
            self.createdAt = createdAt
        }
    }
}
