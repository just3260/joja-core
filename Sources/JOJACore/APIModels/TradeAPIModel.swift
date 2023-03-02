
import Foundation

public struct TradeAPIModel: Codable {
    
    public enum GoodsType: Int, Codable {
        case beret // 貝雷帽
        case flatBeret // 平頂貝雷帽
        case bucketHat // 漁夫帽
        case sun // 太陽帽
        case scarf // 領巾
        case ring // 戒指
        case bucketBag // 水桶包
        case other // 其他
    }
    
    public let id: UUID
    public let goods: String
    public let types: [GoodsType]
    public let amount: Int
    public let note: String?
    public let buyerID: UUID
    public let createdAt: Date
    
    public init(
        id: UUID,
        goods: String,
        types: [GoodsType],
        amount: Int,
        note: String?,
        buyerID: UUID,
        createdAt: Date
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
        public let types: [GoodsType]
        public let amount: Int
        public let note: String?
        public let buyerID: UUID
        
        public init(
            goods: String,
            types: [GoodsType],
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
        public let types: [GoodsType]
        public let amount: Int
        public let note: String?
        public let buyerID: UUID
        public let createdAt: Date?
        
        public init(
            id: UUID,
            goods: String,
            types: [GoodsType],
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
