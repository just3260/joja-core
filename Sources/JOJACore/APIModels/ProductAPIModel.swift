
import Foundation

public struct ProductAPIModel: Codable, Hashable {
    
    public enum Size: Int, Codable, Hashable {
        case freeSize
        case extraSmall
        case small
        case medium
        case large
        case short
        case long
        case narrow
        case wide
    }
    
    public let id: UUID
    public let fabricId: UUID?
    public let brand: TypeAPIModel.Brand
    public let goods: TypeAPIModel.Goods
    public let size: Size
    public let price: Int
//    public let count: Int // 不確定是否需要，目前傾向同一品項用不同 id 區分
    public let storage: TypeAPIModel.Location
    public let note: String?
    public let tradeID: UUID?
    public let createdAt: Date?
    public let updatedAt: Date?
    
    public init(
        id: UUID,
        fabricId: UUID?,
        brand: TypeAPIModel.Brand,
        goods: TypeAPIModel.Goods,
        size: Size,
        price: Int,
//        count: Int,
        storage: TypeAPIModel.Location,
        note: String?,
        tradeID: UUID?,
        createdAt: Date?,
        updatedAt: Date?
    ) {
        self.id = id
        self.fabricId = fabricId
        self.brand = brand
        self.goods = goods
        self.size = size
        self.price = price
//        self.count = count
        self.storage = storage
        self.note = note
        self.tradeID = tradeID
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

extension ProductAPIModel {
    public struct Request: Codable, Hashable {
        
        public let brand: TypeAPIModel.Brand
        public let amount: Int
        public let count: Int
        public let discount: Int?
        public let note: String?
        
        public init(
            brand: TypeAPIModel.Brand,
            amount: Int,
            count: Int,
            discount: Int?,
            note: String?
        ) {
            self.brand = brand
            self.amount = amount
            self.count = count
            self.discount = discount
            self.note = note
        }
    }
}

extension ProductAPIModel {
    public struct Response: Codable, Hashable {
        public let id: UUID
        public let brand: TypeAPIModel.Brand
        public let amount: Int
        public let count: Int
        public let note: String?
        public let tradeID: UUID
        public let createdAt: Date?
        
        public init(
            id: UUID,
            brand: TypeAPIModel.Brand,
            amount: Int,
            count: Int,
            note: String?,
            tradeID: UUID,
            createdAt: Date?
        ) {
            self.id = id
            self.brand = brand
            self.amount = amount
            self.count = count
            self.note = note
            self.tradeID = tradeID
            self.createdAt = createdAt
        }
    }
}
