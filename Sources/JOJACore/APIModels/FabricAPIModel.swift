import Foundation

public struct FabricAPIModel: Codable, Hashable, Sendable {
    
    public let id: UUID
    public let name: String?
    public let component: Component
    public let sku: String
    public let price: Int
    public let pricing: Int?
//    public let buy: Int
    public let stock: Double
    public let storage: [String: Double]
    public let tags: [String]
    public let description: String?
    public let note: String?
    public let imageUrl: [String]
    public let products: [ProductTemplateAPIModel]
    public let purchaseSource: TypeAPIModel.PurchaseSource?
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
        stock: Double,
        storage: [String: Double],
        tags: [String],
        description: String?,
        note: String?,
        imageUrl: [String],
        products: [ProductTemplateAPIModel],
        purchaseSource: TypeAPIModel.PurchaseSource? = nil,
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
        self.purchaseSource = purchaseSource
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.log = log
    }
}

extension FabricAPIModel {
    public struct Request: Codable, Hashable, Sendable {
        public let name: String?
        public let component: Component
        public let sku: String?
        public let price: Int
        public let pricing: Int?
        public let buy: Double
        public let location: TypeAPIModel.Location
//        public let tags: [String]
        public let description: String?
        public let note: String?
        public let imageUrl: [String]?
        public let purchaseSource: TypeAPIModel.PurchaseSource?

        public init(
            name: String?,
            component: Component,
            sku: String?,
            price: Int,
            pricing: Int?,
            buy: Double,
            location: TypeAPIModel.Location,
//            tags: [String],
            description: String?,
            note: String?,
            imageUrl: [String]?,
            purchaseSource: TypeAPIModel.PurchaseSource? = nil
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
            self.imageUrl = imageUrl
            self.purchaseSource = purchaseSource
        }
    }
    
    public struct UpdateRequest: Codable, Hashable, Sendable {
        public let name: String?
        public let pricing: Int?
        public let description: String?
        public let note: String?
        public let purchaseSource: TypeAPIModel.PurchaseSource?

        public init(
            name: String?,
            pricing: Int?,
            description: String?,
            note: String?,
            purchaseSource: TypeAPIModel.PurchaseSource? = nil
        ) {
            self.name = name
            self.pricing = pricing
            self.description = description
            self.note = note
            self.purchaseSource = purchaseSource
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
        public let buy: Double
        public let location: TypeAPIModel.Location
        
        public init(
            price: Int,
            buy: Double,
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
        public let amount: Double
        
        public init(
            source: TypeAPIModel.Location,
            destination: TypeAPIModel.Location?,
            amount: Double
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
        public let stock: Double
        public let storage: [String: Double]
        public let tags: [String]
        public let description: String?
        public let note: String?
        public let imageUrl: [String]
        public let products: [ProductTemplateAPIModel.ListData]
        public let purchaseSource: TypeAPIModel.PurchaseSource?
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
            stock: Double,
            storage: [String: Double],
            tags: [String],
            description: String?,
            note: String?,
            imageUrl: [String],
            products: [ProductTemplateAPIModel.ListData],
            purchaseSource: TypeAPIModel.PurchaseSource? = nil,
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
            self.purchaseSource = purchaseSource
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
            products: [ProductTemplateAPIModel.ListData.sample],
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
        public let stock: Double
        public let component: Component
        public let imageUrl: String?
        public let purchaseSource: TypeAPIModel.PurchaseSource?

        public init(
            id: UUID,
            name: String?,
            sku: String,
            stock: Double,
            component: Component,
            imageUrl: String?,
            purchaseSource: TypeAPIModel.PurchaseSource? = nil
        ) {
            self.id = id
            self.name = name
            self.sku = sku
            self.stock = stock
            self.component = component
            self.imageUrl = imageUrl
            self.purchaseSource = purchaseSource
        }

        public static let sample: FabricAPIModel.ListData = .init(
            id: UUID(),
            name: "日本棉布",
            sku: "sn-101",
            stock: 3,
            component: .sample,
            imageUrl: "japan.print.com"
        )

        public static func sampleList(page: Int = 1, count: Int = 10) -> [FabricAPIModel.ListData] {
            return (1...count).map { index in
                FabricAPIModel.ListData(
                    id: UUID(),
                    name: "日本棉布",
                    sku: "sn-101-\(index)",
                    stock: 2,
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
                    stock: 2,
                    component: .sample,
                    imageUrl: "japan.print.\(index).com"
                )
            }
        }
    }
}

// MARK: - Product Locations Response
extension FabricAPIModel {
    /// 單個產品模板的位置統計
    public struct ProductLocationSummary: Codable, Hashable, Sendable {
        public let templateId: UUID
        public let templateSku: String
        public let templatePrice: Int
        public let totalCount: Int
        public let locations: [ProductTemplateAPIModel.LocationSummary]

        public init(
            templateId: UUID,
            templateSku: String,
            templatePrice: Int,
            totalCount: Int,
            locations: [ProductTemplateAPIModel.LocationSummary]
        ) {
            self.templateId = templateId
            self.templateSku = templateSku
            self.templatePrice = templatePrice
            self.totalCount = totalCount
            self.locations = locations
        }

        public static let sample: FabricAPIModel.ProductLocationSummary = .init(
            templateId: UUID(),
            templateSku: "sn-101-B-M",
            templatePrice: 1680,
            totalCount: 5,
            locations: [.sample]
        )
    }

    /// Fabric 下所有產品的位置統計響應
    public struct ProductLocationsResponse: Codable, Hashable, Sendable {
        public let fabricId: UUID
        public let fabricSku: String
        public let fabricName: String?
        public let totalProducts: Int
        public let totalInventories: Int
        public let products: [ProductLocationSummary]

        public init(
            fabricId: UUID,
            fabricSku: String,
            fabricName: String?,
            totalProducts: Int,
            totalInventories: Int,
            products: [ProductLocationSummary]
        ) {
            self.fabricId = fabricId
            self.fabricSku = fabricSku
            self.fabricName = fabricName
            self.totalProducts = totalProducts
            self.totalInventories = totalInventories
            self.products = products
        }

        public static let sample: FabricAPIModel.ProductLocationsResponse = .init(
            fabricId: UUID(),
            fabricSku: "sn-101",
            fabricName: "日本印花棉布",
            totalProducts: 3,
            totalInventories: 45,
            products: [ProductLocationSummary.sample]
        )
    }
}
