
import Foundation

public struct ProductAPIModel: Codable, Hashable {
    
    public let id: UUID
    public let brand: TypeAPIModel.Brand
//    public let goods: TypeAPIModel.Goods
//    public let material: TypeAPIModel.Material
//    public let color: TypeAPIModel.Color
//    public let design: TypeAPIModel.Design
    public let amount: Int
    public let count: Int
    public let note: String?
    public let tradeID: UUID
    public let createdAt: Date?
    
    public init(
        id: UUID,
        brand: TypeAPIModel.Brand,
//        goods: TypeAPIModel.Goods,
//        material: TypeAPIModel.Material,
//        color: TypeAPIModel.Color,
//        design: TypeAPIModel.Design,
        amount: Int,
        count: Int,
        note: String?,
        tradeID: UUID,
        createdAt: Date?
    ) {
        self.id = id
        self.brand = brand
//        self.goods = goods
//        self.material = material
//        self.color = color
//        self.design = design
        self.amount = amount
        self.count = count
        self.note = note
        self.tradeID = tradeID
        self.createdAt = createdAt
    }
}

extension ProductAPIModel {
    public struct Request: Codable, Hashable {
        
        public let brand: TypeAPIModel.Brand
//        public let goods: TypeAPIModel.Goods
//        public let material: TypeAPIModel.Material
//        public let color: TypeAPIModel.Color
//        public let design: TypeAPIModel.Design
        public let amount: Int
        public let count: Int
        public let note: String?
        
        public init(
            brand: TypeAPIModel.Brand,
//            goods: TypeAPIModel.Goods,
//            material: TypeAPIModel.Material,
//            color: TypeAPIModel.Color,
//            design: TypeAPIModel.Design,
            amount: Int,
            count: Int,
            note: String?
        ) {
            self.brand = brand
//            self.goods = goods
//            self.material = material
//            self.color = color
//            self.design = design
            self.amount = amount
            self.count = count
            self.note = note
        }
    }
}

extension ProductAPIModel {
    public struct Response: Codable, Hashable {
        public let id: UUID
        public let brand: TypeAPIModel.Brand
//        public let goods: TypeAPIModel.Goods
//        public let material: TypeAPIModel.Material
//        public let color: TypeAPIModel.Color
//        public let design: TypeAPIModel.Design
        public let amount: Int
        public let count: Int
        public let note: String?
        public let tradeID: UUID
        public let createdAt: Date?
        
        public init(
            id: UUID,
            brand: TypeAPIModel.Brand,
//            goods: TypeAPIModel.Goods,
//            material: TypeAPIModel.Material,
//            color: TypeAPIModel.Color,
//            design: TypeAPIModel.Design,
            amount: Int,
            count: Int,
            note: String?,
            tradeID: UUID,
            createdAt: Date?
        ) {
            self.id = id
            self.brand = brand
//            self.goods = goods
//            self.material = material
//            self.color = color
//            self.design = design
            self.amount = amount
            self.count = count
            self.note = note
            self.tradeID = tradeID
            self.createdAt = createdAt
        }
    }
}
