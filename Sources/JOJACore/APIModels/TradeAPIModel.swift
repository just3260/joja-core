
import Foundation

public struct TradeAPIModel: Codable, Hashable {
    
    public let id: UUID
    public let products: [ProductAPIModel]
    public let amount: Int
    public let note: String?
    public let description: String?
    public let buyerID: UUID
    public let createdAt: Date?
    
    public init(
        id: UUID,
        products: [ProductAPIModel],
        amount: Int,
        note: String?,
        description: String?,
        buyerID: UUID,
        createdAt: Date?
    ) {
        self.id = id
        self.products = products
        self.amount = amount
        self.note = note
        self.description = description
        self.buyerID = buyerID
        self.createdAt = createdAt
    }
}

extension TradeAPIModel {
    public struct Request: Codable, Hashable {
        public let id: UUID?
        public let products: [ProductAPIModel.Request]
        public let discount: Int?
        public let note: String?
        public let buyerID: UUID
        
        public init(
            id: UUID?,
            products: [ProductAPIModel.Request],
            discount: Int?,
            note: String?,
            buyerID: UUID
        ) {
            self.id = id
            self.products = products
            self.discount = discount
            self.note = note
            self.buyerID = buyerID
        }
    }
    
    public struct Response: Codable, Hashable {
        public let id: UUID
        public let products: [ProductAPIModel.Response]
        public let amount: Int
        public let note: String?
        public let description: String?
        public let buyerID: UUID
        public let createdAt: Date?
        
        public init(
            id: UUID,
            products: [ProductAPIModel.Response],
            amount: Int,
            note: String?,
            description: String?,
            buyerID: UUID,
            createdAt: Date?
        ) {
            self.id = id
            self.products = products
            self.amount = amount
            self.note = note
            self.description = description
            self.buyerID = buyerID
            self.createdAt = createdAt
        }
    }
    
    public struct SimpleTrade: Codable, Hashable {
        public let id: UUID
        public let amount: Int
        public let note: String?
        public let description: String?
        public let buyerID: UUID
        public let createdAt: Date?
        
        public init(
            id: UUID,
            amount: Int,
            note: String?,
            description: String?,
            buyerID: UUID,
            createdAt: Date?
        ) {
            self.id = id
            self.amount = amount
            self.note = note
            self.description = description
            self.buyerID = buyerID
            self.createdAt = createdAt
        }
    }
}
