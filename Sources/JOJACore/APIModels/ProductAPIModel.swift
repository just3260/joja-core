
import Foundation

public struct ProductAPIModel: Codable, Hashable {
    
    public let id: UUID
    public let fabricId: UUID?
    public let name: String?
    public let sn: String
    public let component: FabricAPIModel.Component
    public let style: Style
    public let price: Int
//    public let count: Int // 不確定是否需要，目前傾向同一品項用不同 id 區分
    public let storage: TypeAPIModel.Location
    public let note: String?
    public let tradeID: UUID?
    public let createdAt: Date?
    public let updatedAt: Date?
    public let log: String?
    
    public init(
        id: UUID,
        fabricId: UUID?,
        name: String?,
        sn: String,
        component: FabricAPIModel.Component,
        style: Style,
        price: Int,
//        count: Int,
        storage: TypeAPIModel.Location,
        note: String?,
        tradeID: UUID?,
        createdAt: Date?,
        updatedAt: Date?,
        log: String?
    ) {
        self.id = id
        self.fabricId = fabricId
        self.name = name
        self.sn = sn
        self.component = component
        self.style = style
        self.price = price
//        self.count = count
        self.storage = storage
        self.note = note
        self.tradeID = tradeID
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.log = log
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
        
        public init(
            fabricId: UUID?,
            jojaFabric: TypeAPIModel.JojaFabricGoods,
            size: TypeAPIModel.Size,
            price: Int
        ) {
            self.fabricId = fabricId
            self.style = Style(jojaFabric: jojaFabric, size: size)
            self.price = price
            self.storage = .finish
            self.discount = nil
            self.note = nil
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
        
        public init(
            jojaFabric: TypeAPIModel.JojaFabricGoods,
            size: TypeAPIModel.Size
        ) {
            self.brand = .joja
            self.type = .jojaFabric
            self.jojaFabric = jojaFabric
            self.jojaOther = nil
            self.otherGoods = nil
            self.size = size
        }
    }
}

extension ProductAPIModel {
    public struct Response: Codable, Hashable {
        
        public let id: UUID
        public let fabricId: UUID?
        public let name: String?
        public let sn: String
        public let component: FabricAPIModel.Component
        public let style: Style
        public let price: Int
        public let storage: TypeAPIModel.Location
        public let note: String?
        public let tradeID: UUID?
        public let createdAt: Date?
        public let updatedAt: Date?
        public let log: String?
        
        public init(
            id: UUID,
            fabricId: UUID?,
            name: String?,
            sn: String,
            component: FabricAPIModel.Component,
            style: Style,
            price: Int,
            storage: TypeAPIModel.Location,
            note: String?,
            tradeID: UUID?,
            createdAt: Date?,
            updatedAt: Date?,
            log: String?
        ) {
            self.id = id
            self.fabricId = fabricId
            self.name = name
            self.sn = sn
            self.component = component
            self.style = style
            self.price = price
            self.storage = storage
            self.note = note
            self.tradeID = tradeID
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.log = log
        }
    }
}

extension ProductAPIModel {
    public struct ListData: Codable, Hashable {
        public let id: UUID
        public let name: String?
        public let sn: String
        public let style: Style
        public let price: Int
        
        public init(
            id: UUID,
            name: String?,
            sn: String,
            style: Style,
            price: Int
        ) {
            self.id = id
            self.name = name
            self.sn = sn
            self.style = style
            self.price = price
        }
    }
}
