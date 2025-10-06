import Foundation

public struct FabricAPIModel: Codable, Hashable, Sendable {
    
    public let id: UUID
    public let name: String?
    public let component: Component
    public let sku: String
    public let price: Int
    public let pricing: Int?
//    public let buy: Int
    public let stock: Int
    public let storage: [String: Int]
    public let tags: [String]
    public let description: String?
    public let note: String?
    public let imageUrl: [String]
    public let products: [ProductAPIModel]
    public let createdAt: Date?
    public let updatedAt: Date?
    public let log: String?
    
    public init(
        id: UUID,
        name: String?,
        component: Component,
        sku: String,
        price: Int,
        pricing: Int?,
//        buy: Int,
        stock: Int,
        storage: [String: Int],
        tags: [String],
        description: String?,
        note: String?,
        imageUrl: [String],
        products: [ProductAPIModel],
        createdAt: Date?,
        updatedAt: Date?,
        log: String?
    ) {
        self.id = id
        self.name = name
        self.component = component
        self.sku = sku
        self.price = price
        self.pricing = pricing
//        self.buy = buy
        self.stock = stock
        self.storage = storage
        self.tags = tags
        self.description = description
        self.note = note
        self.imageUrl = imageUrl
        self.products = products
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.log = log
    }
}

extension FabricAPIModel {
    public struct Request: Codable, Hashable, Sendable {
        public let name: String?
        public let component: Component
        public let sku: String
        public let price: Int
        public let pricing: Int?
        public let buy: Int
        public let location: TypeAPIModel.Location
//        public let tags: [String]
        public let description: String?
        public let note: String?
        
        public init(
            name: String?,
            component: Component,
            sku: String,
            price: Int,
            pricing: Int?,
            buy: Int,
            location: TypeAPIModel.Location,
//            tags: [String],
            description: String?,
            note: String?
        ) {
            self.name = name
            self.component = component
            self.sku = sku
            self.price = price
            self.pricing = pricing
            self.buy = buy
            self.location = location
//            self.tags = tags
            self.description = description
            self.note = note
        }
    }
    
    public struct UpdateRequest: Codable, Hashable, Sendable {
        public let name: String?
        public let pricing: Int?
        public let description: String?
        public let note: String?
        
        public init(
            name: String?,
            pricing: Int?,
            description: String?,
            note: String?
        ) {
            self.name = name
            self.pricing = pricing
            self.description = description
            self.note = note
        }
    }
    
    public struct Component: Codable, Hashable, Sendable {
        public let material: [TypeAPIModel.Material]
        public let cottonMaterial: [TypeAPIModel.CottonMaterial]?
        public let age: [TypeAPIModel.Age]
        public let design: [TypeAPIModel.Design]
        public let color: [TypeAPIModel.Color]
        
        public init(
            material: [TypeAPIModel.Material],
            cottonMaterial: [TypeAPIModel.CottonMaterial]?,
            age: [TypeAPIModel.Age],
            design: [TypeAPIModel.Design],
            color: [TypeAPIModel.Color]
        ) {
            self.material = material
            self.cottonMaterial = cottonMaterial
            self.age = age
            self.design = design
            self.color = color
        }
        
        public static let sample: FabricAPIModel.Component = .init(
            material: [.cotton],
            cottonMaterial: [.japan_plain],
            age: [.new],
            design: [.animal],
            color: [.brown]
        )
    }
    
    public struct StorageRequest: Codable, Hashable, Sendable {
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
    
    public struct StorageUpdatedRequest: Codable, Hashable, Sendable {
        public let source: TypeAPIModel.Location
        public let destination: TypeAPIModel.Location?
        public let amount: Int
        
        public init(
            source: TypeAPIModel.Location,
            destination: TypeAPIModel.Location?,
            amount: Int
        ) {
            self.source = source
            self.destination = destination
            self.amount = amount
        }
    }
    
    public struct TagRequest: Codable, Hashable, Sendable {
        public let tags: [String]
        
        public init(
            tags: [String]
        ) {
            self.tags = tags
        }
    }
    
    public struct Response: Codable, Hashable, Sendable {
        public let id: UUID
        public let name: String?
        public let component: Component
        public let sku: String
        public let price: Int
        public let pricing: Int?
//        public let buy: Int
        public let stock: Int
        public let storage: [String: Int]
        public let tags: [String]
        public let description: String?
        public let note: String?
        public let imageUrl: [String]
        public let products: [ProductAPIModel.ListData]
        public let createdAt: Date?
        public let updatedAt: Date?
        public let log: String?
        
        public init(
            id: UUID,
            name: String?,
            component: Component,
            sku: String,
            price: Int,
            pricing: Int?,
//            buy: Int,
            stock: Int,
            storage: [String: Int],
            tags: [String],
            description: String?,
            note: String?,
            imageUrl: [String],
            products: [ProductAPIModel.ListData],
            createdAt: Date?,
            updatedAt: Date?,
            log: String?
        ) {
            self.id = id
            self.name = name
            self.component = component
            self.sku = sku
            self.price = price
            self.pricing = pricing
//            self.buy = buy
            self.stock = stock
            self.storage = storage
            self.tags = tags
            self.description = description
            self.note = note
            self.imageUrl = imageUrl
            self.products = products
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.log = log
        }
        
        public static let sample: FabricAPIModel.Response = .init(
            id: UUID(),
            name: "日本印花棉布",
            component: .sample,
            sku: "sn-101",
            price: 360,
            pricing: 1880,
            stock: 6,
            storage: [:],
            tags: [],
            description: "棉布",
            note: "備註資料",
            imageUrl: [],
            products: [ProductAPIModel.ListData.sample],
            createdAt: Calendar.current.date(byAdding: .day, value: -1, to: Date()),
            updatedAt: Calendar.current.date(byAdding: .day, value: -1, to: Date()),
            log: "log記錄"
        )
    }
}

extension FabricAPIModel {
    public struct ListData: Codable, Hashable, Sendable {
        public let id: UUID
        public let name: String?
        public let sku: String
        public let component: Component
        public let imageUrl: String?
        
        public init(
            id: UUID,
            name: String?,
            sku: String,
            component: Component,
            imageUrl: String?
        ) {
            self.id = id
            self.name = name
            self.sku = sku
            self.component = component
            self.imageUrl = imageUrl
        }
        
        public static let sample: FabricAPIModel.ListData = .init(
            id: UUID(),
            name: "日本棉布",
            sku: "sn-101",
            component: .sample,
            imageUrl: "japan.print.com"
        )
        
        public static func sampleList(page: Int = 1, count: Int = 10) -> [FabricAPIModel.ListData] {
            return (1...count).map { index in
                FabricAPIModel.ListData(
                    id: UUID(),
                    name: "日本棉布",
                    sku: "sn-101-\(index)",
                    component: .sample,
                    imageUrl: "japan.print.\(index).com"
                )
            }
        }
        
        public static func sampleSearchResults(count: Int = 5) -> [FabricAPIModel.ListData] {
            return (1...count).map { index in
                FabricAPIModel.ListData(
                    id: UUID(),
                    name: "日本棉布",
                    sku: "sn-101-\(index)",
                    component: .sample,
                    imageUrl: "japan.print.\(index).com"
                )
            }
        }
    }
}
