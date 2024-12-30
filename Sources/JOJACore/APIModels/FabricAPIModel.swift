
import Foundation

public struct FabricAPIModel: Codable, Hashable {
    
    public let id: UUID
    public let name: String?
    public let component: Component
    public let sn: String
    public let price: Int
//    public let buy: Int
    public let stock: Int
    public let storage: [String: Int]
    public let tags: [String]
    public let description: String?
    public let note: String?
    public let imageUrl: [String]
    public let createdAt: Date?
    public let updatedAt: Date?
    public let log: String?
    
    public init(
        id: UUID,
        name: String?,
        component: Component,
        sn: String,
        price: Int,
//        buy: Int,
        stock: Int,
        storage: [String: Int],
        tags: [String],
        description: String?,
        note: String?,
        imageUrl: [String],
        createdAt: Date?,
        updatedAt: Date?,
        log: String?
    ) {
        self.id = id
        self.name = name
        self.component = component
        self.sn = sn
        self.price = price
//        self.buy = buy
        self.stock = stock
        self.storage = storage
        self.tags = tags
        self.description = description
        self.note = note
        self.imageUrl = imageUrl
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.log = log
    }
}

extension FabricAPIModel {
    public struct Request: Codable, Hashable {
        public let name: String?
        public let component: Component
        public let price: Int
        public let buy: Int
        public let location: TypeAPIModel.Location
//        public let tags: [String]
        public let description: String?
        public let note: String?
        
        public init(
            name: String?,
            component: Component,
            price: Int,
            buy: Int,
            location: TypeAPIModel.Location,
//            tags: [String],
            description: String?,
            note: String?
        ) {
            self.name = name
            self.component = component
            self.price = price
            self.buy = buy
            self.location = location
//            self.tags = tags
            self.description = description
            self.note = note
        }
    }
    
    public struct UpdateRequest: Codable, Hashable {
        public let name: String?
        public let description: String?
        public let note: String?
        
        public init(
            name: String?,
            description: String?,
            note: String?
        ) {
            self.name = name
            self.description = description
            self.note = note
        }
    }
    
    public struct Component: Codable, Hashable {
        public let material: TypeAPIModel.Material
        public let cottonMaterial: TypeAPIModel.CottonMaterial?
        public let age: TypeAPIModel.Age
        public let design: TypeAPIModel.Design
        public let color: TypeAPIModel.Color
        
        public init(
            material: TypeAPIModel.Material,
            cottonMaterial: TypeAPIModel.CottonMaterial?,
            age: TypeAPIModel.Age,
            design: TypeAPIModel.Design,
            color: TypeAPIModel.Color
        ) {
            self.material = material
            self.cottonMaterial = cottonMaterial
            self.age = age
            self.design = design
            self.color = color
        }
    }
    
    public struct StorageRequest: Codable, Hashable {
        public let price: Int
        public let buy: Int
        public let location: TypeAPIModel.Location
        
        public init(
            price: Int,
            buy: Int,
            location: TypeAPIModel.Location
        ) {
            self.price = price
            self.buy = buy
            self.location = location
        }
    }
    
    public struct StorageUpdatedRequest: Codable, Hashable {
        public let source: TypeAPIModel.Location
        public let amount: Int
        public let destination: TypeAPIModel.Location
        
        public init(
            source: TypeAPIModel.Location,
            amount: Int,
            destination: TypeAPIModel.Location
        ) {
            self.source = source
            self.amount = amount
            self.destination = destination
        }
    }
    
    public struct TagRequest: Codable, Hashable {
        public let tags: [String]
        
        public init(
            tags: [String]
        ) {
            self.tags = tags
        }
    }
    
    public struct Response: Codable, Hashable {
        public let id: UUID
        public let name: String?
        public let component: Component
        public let sn: String
        public let price: Int
//        public let buy: Int
        public let stock: Int
        public let storage: [String: Int]
        public let tags: [String]
        public let description: String?
        public let note: String?
        public let imageUrl: [String]
        public let createdAt: Date?
        public let updatedAt: Date?
        public let log: String?
        
        public init(
            id: UUID,
            name: String?,
            component: Component,
            sn: String,
            price: Int,
//            buy: Int,
            stock: Int,
            storage: [String: Int],
            tags: [String],
            description: String?,
            note: String?,
            imageUrl: [String],
            createdAt: Date?,
            updatedAt: Date?,
            log: String?
        ) {
            self.id = id
            self.name = name
            self.component = component
            self.sn = sn
            self.price = price
//            self.buy = buy
            self.stock = stock
            self.storage = storage
            self.tags = tags
            self.description = description
            self.note = note
            self.imageUrl = imageUrl
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.log = log
        }
    }
}

extension FabricAPIModel {
    public struct ListData: Codable, Hashable {
        public let id: UUID
        public let name: String?
        public let sn: String
        public let component: Component
        public let imageUrl: String?
        
        public init(
            id: UUID,
            name: String?,
            sn: String,
            component: Component,
            imageUrl: String?
        ) {
            self.id = id
            self.name = name
            self.sn = sn
            self.component = component
            self.imageUrl = imageUrl
        }
    }
}
