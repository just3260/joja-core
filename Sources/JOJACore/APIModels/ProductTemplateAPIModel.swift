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
    public let isActive: Bool
    public let inventoryCount: Int  // 庫存數量
    public let createdAt: Date?
    public let updatedAt: Date?

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
        isActive: Bool,
        inventoryCount: Int,
        createdAt: Date?,
        updatedAt: Date?
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
        self.isActive = isActive
        self.inventoryCount = inventoryCount
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

extension ProductTemplateAPIModel {
    public struct Request: Codable, Hashable, Sendable {

        public let sku: String?
        public let name: String?
        public let style: ProductAPIModel.Style
        public let basePrice: Int
        public let fabricId: UUID?
        public let component: FabricAPIModel.Component?
        public let images: [String]?
        public let description: String?

        public init(
            sku: String?,
            name: String?,
            style: ProductAPIModel.Style,
            basePrice: Int,
            fabricId: UUID?,
            component: FabricAPIModel.Component?,
            images: [String]?,
            description: String?
        ) {
            self.sku = sku
            self.name = name
            self.style = style
            self.basePrice = basePrice
            self.fabricId = fabricId
            self.component = component
            self.images = images
            self.description = description
        }

        /// 便利初始化：布料商品
        public init(
            sku: String?,
            name: String?,
            fabricId: UUID,
            jojaFabric: TypeAPIModel.JojaFabricGoods,
            size: TypeAPIModel.Size,
            basePrice: Int,
            images: [String]?,
            description: String?
        ) {
            self.sku = sku
            self.name = name
            self.style = ProductAPIModel.Style(jojaFabric: jojaFabric, size: size)
            self.basePrice = basePrice
            self.fabricId = fabricId
            self.component = nil
            self.images = images
            self.description = description
        }

        /// 便利初始化：非布料商品
        public init(
            sku: String?,
            name: String?,
            brand: TypeAPIModel.Brand,
            type: TypeAPIModel.ProductType,
            jojaOther: TypeAPIModel.JojaOtherGoods?,
            otherGoods: TypeAPIModel.OtherBrandGoods?,
            size: TypeAPIModel.Size,
            component: FabricAPIModel.Component,
            basePrice: Int,
            images: [String]?,
            description: String?
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
            self.images = images
            self.description = description
        }

        /// 驗證請求資料
        public func validate() throws {
            switch style.type {
            case .jojaFabric:
                guard fabricId != nil else {
                    throw ValidationError.fabricBasedProductMustHaveFabricId
                }
                guard component == nil else {
                    throw ValidationError.fabricBasedProductShouldNotHaveComponent
                }

            case .jojaOther, .otherBrand:
                guard fabricId == nil else {
                    throw ValidationError.nonFabricProductShouldNotHaveFabricId
                }
                guard component != nil else {
                    throw ValidationError.nonFabricProductMustHaveComponent
                }
            }
        }
    }

    public struct UpdateRequest: Codable, Hashable, Sendable {
        public let name: String?
        public let basePrice: Int?
        public let description: String?
        public let isActive: Bool?

        public init(
            name: String?,
            basePrice: Int?,
            description: String?,
            isActive: Bool?
        ) {
            self.name = name
            self.basePrice = basePrice
            self.description = description
            self.isActive = isActive
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
        public let isActive: Bool
        public let inventoryCount: Int
        public let createdAt: Date?
        public let updatedAt: Date?

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
            isActive: Bool,
            inventoryCount: Int,
            createdAt: Date?,
            updatedAt: Date?
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
            self.isActive = isActive
            self.inventoryCount = inventoryCount
            self.createdAt = createdAt
            self.updatedAt = updatedAt
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
            isActive: true,
            inventoryCount: 3,
            createdAt: Calendar.current.date(byAdding: .day, value: -7, to: Date()),
            updatedAt: Calendar.current.date(byAdding: .day, value: -1, to: Date())
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
        public let imageUrl: String?
        public let isActive: Bool
        public let inventoryCount: Int

        public init(
            id: UUID,
            sku: String,
            name: String?,
            style: ProductAPIModel.Style,
            basePrice: Int,
            imageUrl: String?,
            isActive: Bool,
            inventoryCount: Int
        ) {
            self.id = id
            self.sku = sku
            self.name = name
            self.style = style
            self.basePrice = basePrice
            self.imageUrl = imageUrl
            self.isActive = isActive
            self.inventoryCount = inventoryCount
        }

        public static let sample: ProductTemplateAPIModel.ListData = .init(
            id: UUID(),
            sku: "sn-101-B-M",
            name: "日本印花貝蕾帽",
            style: .sample,
            basePrice: 1880,
            imageUrl: "image1.jpg",
            isActive: true,
            inventoryCount: 3
        )

        public static func sampleList(page: Int = 1, count: Int = 10) -> [ProductTemplateAPIModel.ListData] {
            return (1...count).map { index in
                ProductTemplateAPIModel.ListData(
                    id: UUID(),
                    sku: "sn-101-B-M-\(index)",
                    name: "貝蕾帽-\(index)",
                    style: .sample,
                    basePrice: 1880,
                    imageUrl: "image\(index).jpg",
                    isActive: index % 3 != 0,
                    inventoryCount: index * 2
                )
            }
        }
    }
}

// MARK: - Validation Error
extension ProductTemplateAPIModel {
    public enum ValidationError: Error, LocalizedError {
        case fabricBasedProductMustHaveFabricId
        case fabricBasedProductShouldNotHaveComponent
        case nonFabricProductShouldNotHaveFabricId
        case nonFabricProductMustHaveComponent

        public var errorDescription: String? {
            switch self {
            case .fabricBasedProductMustHaveFabricId:
                return "Fabric-based product must have fabricId"
            case .fabricBasedProductShouldNotHaveComponent:
                return "Fabric-based product should not have component field"
            case .nonFabricProductShouldNotHaveFabricId:
                return "Non-fabric product should not have fabricId"
            case .nonFabricProductMustHaveComponent:
                return "Non-fabric product must have component"
            }
        }
    }
}
