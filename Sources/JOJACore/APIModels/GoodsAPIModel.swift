
import Foundation

public struct GoodsAPIModel: Codable {
    
    public let id: UUID
    public let brand: TypeAPIModel.Brand
    public let goods: TypeAPIModel.Goods
    public let material: TypeAPIModel.Material
    public let color: TypeAPIModel.Color
    public let amount: Int
    public let count: Int
    public let note: String?
    public let tradeID: UUID
    public let createdAt: Date?
    
    public init(
        id: UUID,
        brand: TypeAPIModel.Brand,
        goods: TypeAPIModel.Goods,
        material: TypeAPIModel.Material,
        color: TypeAPIModel.Color,
        amount: Int,
        count: Int,
        note: String?,
        tradeID: UUID,
        createdAt: Date?
    ) {
        self.id = id
        self.brand = brand
        self.goods = goods
        self.material = material
        self.color = color
        self.amount = amount
        self.count = count
        self.note = note
        self.tradeID = tradeID
        self.createdAt = createdAt
    }
}

extension GoodsAPIModel {
    public struct Request: Codable {
        
        public let brand: TypeAPIModel.Brand
        public let goods: TypeAPIModel.Goods
        public let material: TypeAPIModel.Material
        public let color: TypeAPIModel.Color
        public let amount: Int
        public let count: Int
        public let note: String?
        public let tradeID: UUID
        
        public init(
            brand: TypeAPIModel.Brand,
            goods: TypeAPIModel.Goods,
            material: TypeAPIModel.Material,
            color: TypeAPIModel.Color,
            amount: Int,
            count: Int,
            note: String?,
            tradeID: UUID
        ) {
            self.brand = brand
            self.goods = goods
            self.material = material
            self.color = color
            self.amount = amount
            self.count = count
            self.note = note
            self.tradeID = tradeID
        }
    }
}

extension GoodsAPIModel {
    public struct Response: Codable {
        public let id: UUID
        public let brand: TypeAPIModel.Brand
        public let goods: TypeAPIModel.Goods
        public let material: TypeAPIModel.Material
        public let color: TypeAPIModel.Color
        public let amount: Int
        public let count: Int
        public let note: String?
        public let tradeID: UUID
        public let createdAt: Date?
        
        public init(
            id: UUID,
            brand: TypeAPIModel.Brand,
            goods: TypeAPIModel.Goods,
            material: TypeAPIModel.Material,
            color: TypeAPIModel.Color,
            amount: Int,
            count: Int,
            note: String?,
            tradeID: UUID,
            createdAt: Date?
        ) {
            self.id = id
            self.brand = brand
            self.goods = goods
            self.material = material
            self.color = color
            self.amount = amount
            self.count = count
            self.note = note
            self.tradeID = tradeID
            self.createdAt = createdAt
        }
    }
}
