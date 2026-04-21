import Foundation

public struct ProductTemplateAPIModel: Codable, Hashable, Sendable {

    public let id: UUID
    public let sku: String
    public let name: String?
    public let style: ProductAPIModel.Style
    public let basePrice: Int
    public let fabricId: UUID?
    public let component: FabricAPIModel.Component?
    public let images: [String]
    public let description: String?
    public let isPublished: Bool
    public let inventoryCount: Int  // 庫存數量
    public let inventories: [ProductInventoryAPIModel]
    public let createdAt: Date?
    public let updatedAt: Date?
    public let log: String?
    public let originalSku: String?

    public init(
        id: UUID,
        sku: String,
        name: String?,
        style: ProductAPIModel.Style,
        basePrice: Int,
        fabricId: UUID?,
        component: FabricAPIModel.Component?,
        images: [String],
        description: String?,
        isPublished: Bool,
        inventoryCount: Int,
        inventories: [ProductInventoryAPIModel],
        createdAt: Date?,
        updatedAt: Date?,
        log: String?,
        originalSku: String? = nil
    ) {
        self.id = id
        self.sku = sku
        self.name = name
        self.style = style
        self.basePrice = basePrice
        self.fabricId = fabricId
        self.component = component
        self.images = images
        self.description = description
        self.isPublished = isPublished
        self.inventoryCount = inventoryCount
        self.inventories = inventories
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.log = log
        self.originalSku = originalSku
    }
}

extension ProductTemplateAPIModel {
    public struct Request: Codable, Hashable, Sendable {

        public let sku: String
        public let name: String?
        public let style: ProductAPIModel.Style
        public let basePrice: Int
        public let fabricId: UUID?
        public let component: FabricAPIModel.Component?
        public let description: String?
        public let originalSku: String?

        public init(
            sku: String,
            name: String?,
            style: ProductAPIModel.Style,
            basePrice: Int,
            fabricId: UUID?,
            component: FabricAPIModel.Component?,
            description: String?,
            originalSku: String? = nil
        ) {
            self.sku = sku
            self.name = name
            self.style = style
            self.basePrice = basePrice
            self.fabricId = fabricId
            self.component = component
            self.description = description
            self.originalSku = originalSku
        }

        /// 便利初始化：布料商品
        public init(
            sku: String,
            name: String?,
            fabricId: UUID,
            component: FabricAPIModel.Component,
            jojaFabric: TypeAPIModel.JojaFabricGoods,
            size: TypeAPIModel.Size,
            basePrice: Int,
            description: String?,
            originalSku: String? = nil
        ) {
            self.sku = sku
            self.name = name
            self.style = ProductAPIModel.Style(jojaFabric: jojaFabric, size: size)
            self.basePrice = basePrice
            self.fabricId = fabricId
            self.component = component
            self.description = description
            self.originalSku = originalSku
        }

        /// 便利初始化：非布料商品
        public init(
            sku: String,
            name: String?,
            brand: TypeAPIModel.Brand,
            type: TypeAPIModel.ProductType,
            jojaOther: TypeAPIModel.JojaOtherGoods?,
            otherGoods: TypeAPIModel.OtherBrandGoods?,
            size: TypeAPIModel.Size,
            component: FabricAPIModel.Component,
            basePrice: Int,
            description: String?,
            originalSku: String? = nil
        ) {
            self.sku = sku
            self.name = name
            self.style = ProductAPIModel.Style(
                brand: brand,
                type: type,
                jojaFabric: nil,
                jojaOther: jojaOther,
                otherGoods: otherGoods,
                size: size
            )
            self.basePrice = basePrice
            self.fabricId = nil
            self.component = component
            self.description = description
            self.originalSku = originalSku
        }
    }

    public struct UpdateRequest: Codable, Hashable, Sendable {
        public let name: String?
        public let basePrice: Int?
        public let description: String?
        public let isPublished: Bool?
        public let originalSku: String?

        public init(
            name: String?,
            basePrice: Int?,
            description: String?,
            isPublished: Bool?,
            originalSku: String? = nil
        ) {
            self.name = name
            self.basePrice = basePrice
            self.description = description
            self.isPublished = isPublished
            self.originalSku = originalSku
        }
    }

    public struct Response: Codable, Hashable, Sendable {

        public let id: UUID
        public let sku: String
        public let name: String?
        public let style: ProductAPIModel.Style
        public let basePrice: Int
        public let fabricId: UUID?
        public let component: FabricAPIModel.Component?
        public let images: [String]
        public let description: String?
        public let isPublished: Bool
        public let inventoryCount: Int
        public let inventories: [ProductInventoryAPIModel.Response]
        public let createdAt: Date?
        public let updatedAt: Date?
        public let log: String?
        public let originalSku: String?

        public init(
            id: UUID,
            sku: String,
            name: String?,
            style: ProductAPIModel.Style,
            basePrice: Int,
            fabricId: UUID?,
            component: FabricAPIModel.Component?,
            images: [String],
            description: String?,
            isPublished: Bool,
            inventoryCount: Int,
            inventories: [ProductInventoryAPIModel.Response],
            createdAt: Date?,
            updatedAt: Date?,
            log: String?,
            originalSku: String? = nil
        ) {
            self.id = id
            self.sku = sku
            self.name = name
            self.style = style
            self.basePrice = basePrice
            self.fabricId = fabricId
            self.component = component
            self.images = images
            self.description = description
            self.isPublished = isPublished
            self.inventoryCount = inventoryCount
            self.inventories = inventories
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.log = log
            self.originalSku = originalSku
        }

        public static let sample: ProductTemplateAPIModel.Response = .init(
            id: UUID(),
            sku: "sn-101-B-M",
            name: "日本印花貝蕾帽",
            style: .sample,
            basePrice: 1880,
            fabricId: UUID(),
            component: nil,
            images: ["image1.jpg"],
            description: "使用日本進口布料製作的貝蕾帽",
            isPublished: true,
            inventoryCount: 3,
            inventories: [],
            createdAt: Calendar.current.date(byAdding: .day, value: -7, to: Date()),
            updatedAt: Calendar.current.date(byAdding: .day, value: -1, to: Date()),
            log: "商品模板創建"
        )
    }
}

extension ProductTemplateAPIModel {
    public struct ListData: Codable, Hashable, Sendable {
        public let id: UUID
        public let sku: String
        public let name: String?
        public let style: ProductAPIModel.Style
        public let basePrice: Int
        public let isPublished: Bool
        public let inventoryCount: Int
        public let originalSku: String?
        public let component: FabricAPIModel.Component?

        public init(
            id: UUID,
            sku: String,
            name: String?,
            style: ProductAPIModel.Style,
            basePrice: Int,
            isPublished: Bool,
            inventoryCount: Int,
            originalSku: String? = nil,
            component: FabricAPIModel.Component? = nil
        ) {
            self.id = id
            self.sku = sku
            self.name = name
            self.style = style
            self.basePrice = basePrice
            self.isPublished = isPublished
            self.inventoryCount = inventoryCount
            self.originalSku = originalSku
            self.component = component
        }

        public static let sample: ProductTemplateAPIModel.ListData = .init(
            id: UUID(),
            sku: "sn-101-B-M",
            name: "日本印花貝蕾帽",
            style: .sample,
            basePrice: 1880,
            isPublished: true,
            inventoryCount: 3,
            component: .sample
        )

        public static func sampleList(page: Int = 1, count: Int = 10) -> [ProductTemplateAPIModel.ListData] {
            return (1...count).map { index in
                ProductTemplateAPIModel.ListData(
                    id: UUID(),
                    sku: "sn-101-B-M-\(index)",
                    name: "商品模板 \(index)",
                    style: .sample,
                    basePrice: 1880,
                    isPublished: index % 3 != 0,
                    inventoryCount: index * 2,
                    component: .sample
                )
            }
        }
    }
}

// MARK: - Inventory Location Summary
extension ProductTemplateAPIModel {
    /// 單個位置的庫存統計
    public struct LocationSummary: Codable, Hashable, Sendable {
        public let location: TypeAPIModel.Location
        public let count: Int
        public let inventories: [ProductInventoryAPIModel.ListData]?

        public init(
            location: TypeAPIModel.Location,
            count: Int,
            inventories: [ProductInventoryAPIModel.ListData]? = nil
        ) {
            self.location = location
            self.count = count
            self.inventories = inventories
        }

        public static let sample: ProductTemplateAPIModel.LocationSummary = .init(
            location: .chifeng,
            count: 5,
            inventories: ProductInventoryAPIModel.ListData.sampleList(page: 1, count: 5)
        )
        
        public static let sample2: ProductTemplateAPIModel.LocationSummary = .init(
            location: .tainan,
            count: 3,
            inventories: ProductInventoryAPIModel.ListData.sampleList(page: 1, count: 3)
        )

        public static let sampleSimplified: ProductTemplateAPIModel.LocationSummary = .init(
            location: .chifeng,
            count: 5,
            inventories: nil
        )
    }

    /// 庫存位置統計響應
    public struct LocationSummaryResponse: Codable, Hashable, Sendable {
        public let templateId: UUID
        public let templateSku: String
        public let templateType: ProductAPIModel.Style
        public let price: Int
        public let totalCount: Int
        public let locations: [LocationSummary]

        public init(
            templateId: UUID,
            templateSku: String,
            templateType: ProductAPIModel.Style,
            price: Int,
            totalCount: Int,
            locations: [LocationSummary]
        ) {
            self.templateId = templateId
            self.templateSku = templateSku
            self.templateType = templateType
            self.price = price
            self.totalCount = totalCount
            self.locations = locations
        }

        public static let sample: ProductTemplateAPIModel.LocationSummaryResponse = .init(
            templateId: UUID(),
            templateSku: "sn-101-B-M",
            templateType: ProductAPIModel.Style.sample,
            price: 1880,
            totalCount: 8,
            locations: [.sample, .sample2]
        )
    }
}
