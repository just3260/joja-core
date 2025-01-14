
import Foundation

public struct ProductAPIModel: Codable, Hashable {
    
    public let id: UUID
    public let fabricId: UUID?
    public let style: Style
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
        style: Style,
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
        self.style = style
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
        
        public let fabricId: UUID?
        public let style: Style
        public let price: Int
        public let storage: TypeAPIModel.Location
        public let discount: Int?
        public let note: String?
        
        public init(
            fabricId: UUID?,
            style: Style,
            price: Int,
            storage: TypeAPIModel.Location,
            discount: Int?,
            note: String?
        ) {
            self.fabricId = fabricId
            self.style = style
            self.price = price
            self.storage = storage
            self.discount = discount
            self.note = note
        }
    }
    
    public struct Style: Codable, Hashable {
        public let brand: TypeAPIModel.Brand
        public let type: TypeAPIModel.ProductType
        public let jojaFabric: TypeAPIModel.JojaFabricGoods?
        public let jojaOther: TypeAPIModel.JojaOtherGoods?
        public let otherGoods: TypeAPIModel.OtherBrandGoods?
        public let size: TypeAPIModel.Size
        
        public init(
            brand: TypeAPIModel.Brand,
            type: TypeAPIModel.ProductType,
            jojaFabric: TypeAPIModel.JojaFabricGoods?,
            jojaOther: TypeAPIModel.JojaOtherGoods?,
            otherGoods: TypeAPIModel.OtherBrandGoods?,
            size: TypeAPIModel.Size
        ) {
            self.brand = brand
            self.type = type
            self.jojaFabric = jojaFabric
            self.jojaOther = jojaOther
            self.otherGoods = otherGoods
            self.size = size
        }
    }
}

extension ProductAPIModel {
    public struct Response: Codable, Hashable {
        
        public let id: UUID
        public let fabricId: UUID?
        public let style: Style
        public let price: Int
        public let storage: TypeAPIModel.Location
        public let note: String?
        public let tradeID: UUID?
        public let createdAt: Date?
        public let updatedAt: Date?
        
        public init(
            id: UUID,
            fabricId: UUID?,
            style: Style,
            price: Int,
            storage: TypeAPIModel.Location,
            note: String?,
            tradeID: UUID?,
            createdAt: Date?,
            updatedAt: Date?
        ) {
            self.id = id
            self.fabricId = fabricId
            self.style = style
            self.price = price
            self.storage = storage
            self.note = note
            self.tradeID = tradeID
            self.createdAt = createdAt
            self.updatedAt = updatedAt
        }
    }
}

extension ProductAPIModel {
    public struct ListData: Codable, Hashable {
        public let id: UUID
        public let style: Style
        public let price: Int
        
        public init(
            id: UUID,
            style: Style,
            price: Int
        ) {
            self.id = id
            self.style = style
            self.price = price
        }
    }
}
