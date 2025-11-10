import Foundation

public struct TradeItemAPIModel: Codable, Hashable, Sendable {

    public let id: UUID
    public let tradeId: UUID
    public let inventoryId: UUID
    public let quantity: Int
    public let unitPrice: Int
    public let discount: Int?
    public let subtotal: Int
    public let note: String?
    public let createdAt: Date?
    // 巢狀的庫存資訊（用於詳細檢視）
    public let inventory: ProductInventoryAPIModel.ListData?

    public init(
        id: UUID,
        tradeId: UUID,
        inventoryId: UUID,
        quantity: Int,
        unitPrice: Int,
        discount: Int?,
        subtotal: Int,
        note: String?,
        createdAt: Date?,
        inventory: ProductInventoryAPIModel.ListData?
    ) {
        self.id = id
        self.tradeId = tradeId
        self.inventoryId = inventoryId
        self.quantity = quantity
        self.unitPrice = unitPrice
        self.discount = discount
        self.subtotal = subtotal
        self.note = note
        self.createdAt = createdAt
        self.inventory = inventory
    }
}

extension TradeItemAPIModel {
    public struct Request: Codable, Hashable, Sendable {

        public let inventoryId: UUID
        public let quantity: Int
        public let unitPrice: Int
        public let discount: Int?
        public let note: String?

        public init(
            inventoryId: UUID,
            quantity: Int,
            unitPrice: Int,
            discount: Int?,
            note: String?
        ) {
            self.inventoryId = inventoryId
            self.quantity = quantity
            self.unitPrice = unitPrice
            self.discount = discount
            self.note = note
        }

        /// 計算小計
        public var subtotal: Int {
            let total = quantity * unitPrice
            if let discount = discount {
                return max(0, total - discount)
            }
            return total
        }

        /// 驗證請求資料
        public func validate() throws {
            guard quantity > 0 else {
                throw ValidationError.invalidQuantity
            }
            guard unitPrice >= 0 else {
                throw ValidationError.invalidUnitPrice
            }
            if let discount = discount {
                guard discount >= 0 else {
                    throw ValidationError.invalidDiscount
                }
            }
        }
    }

    public struct UpdateRequest: Codable, Hashable, Sendable {
        public let quantity: Int?
        public let unitPrice: Int?
        public let discount: Int?
        public let note: String?

        public init(
            quantity: Int?,
            unitPrice: Int?,
            discount: Int?,
            note: String?
        ) {
            self.quantity = quantity
            self.unitPrice = unitPrice
            self.discount = discount
            self.note = note
        }
    }

    public struct Response: Codable, Hashable, Sendable {

        public let id: UUID
        public let tradeId: UUID
        public let inventoryId: UUID
        public let quantity: Int
        public let unitPrice: Int
        public let discount: Int?
        public let subtotal: Int
        public let note: String?
        public let createdAt: Date?
        public let inventory: ProductInventoryAPIModel.ListData?

        public init(
            id: UUID,
            tradeId: UUID,
            inventoryId: UUID,
            quantity: Int,
            unitPrice: Int,
            discount: Int?,
            subtotal: Int,
            note: String?,
            createdAt: Date?,
            inventory: ProductInventoryAPIModel.ListData?
        ) {
            self.id = id
            self.tradeId = tradeId
            self.inventoryId = inventoryId
            self.quantity = quantity
            self.unitPrice = unitPrice
            self.discount = discount
            self.subtotal = subtotal
            self.note = note
            self.createdAt = createdAt
            self.inventory = inventory
        }

        public static let sample: TradeItemAPIModel.Response = .init(
            id: UUID(),
            tradeId: UUID(),
            inventoryId: UUID(),
            quantity: 1,
            unitPrice: 1880,
            discount: 200,
            subtotal: 1680,
            note: "這是備注，折扣 $200",
            createdAt: Calendar.current.date(byAdding: .day, value: -1, to: Date()),
            inventory: .sample
        )

        public static func sampleList(count: Int = 3) -> [TradeItemAPIModel.Response] {
            return (1...count).map { index in
                TradeItemAPIModel.Response(
                    id: UUID(),
                    tradeId: UUID(),
                    inventoryId: UUID(),
                    quantity: 1,
                    unitPrice: 1880,
                    discount: index == 1 ? 200 : nil,
                    subtotal: index == 1 ? 1680 : 1880,
                    note: "備注：第\(index)個商品 \(index == 1 ? "折扣$200" : "無折扣")",
                    createdAt: Calendar.current.date(byAdding: .day, value: -1, to: Date()),
                    inventory: .sample
                )
            }
        }
    }
}

extension TradeItemAPIModel {
    public struct ListData: Codable, Hashable, Sendable {
        public let id: UUID
        public let inventoryId: UUID
        public let quantity: Int
        public let unitPrice: Int
        public let discount: Int?
        public let subtotal: Int
        public let templateSku: String

        public init(
            id: UUID,
            inventoryId: UUID,
            quantity: Int,
            unitPrice: Int,
            discount: Int?,
            subtotal: Int,
            templateSku: String
        ) {
            self.id = id
            self.inventoryId = inventoryId
            self.quantity = quantity
            self.unitPrice = unitPrice
            self.discount = discount
            self.subtotal = subtotal
            self.templateSku = templateSku
        }

        public static let sample: TradeItemAPIModel.ListData = .init(
            id: UUID(),
            inventoryId: UUID(),
            quantity: 1,
            unitPrice: 1880,
            discount: 200,
            subtotal: 1680,
            templateSku: "B100015M"
        )

        public static func sampleList(count: Int = 3) -> [TradeItemAPIModel.ListData] {
            return (1...count).map { index in
                TradeItemAPIModel.ListData(
                    id: UUID(),
                    inventoryId: UUID(),
                    quantity: 1,
                    unitPrice: 1880,
                    discount: index == 1 ? 200 : nil,
                    subtotal: index == 1 ? 1680 : 1880,
                    templateSku: "B100015M"
                )
            }
        }
    }
}

// MARK: - Validation Error
extension TradeItemAPIModel {
    public enum ValidationError: Error, LocalizedError {
        case invalidQuantity
        case invalidUnitPrice
        case invalidDiscount

        public var errorDescription: String? {
            switch self {
            case .invalidQuantity:
                return "Quantity must be greater than 0"
            case .invalidUnitPrice:
                return "Unit price must be non-negative"
            case .invalidDiscount:
                return "Discount must be non-negative"
            }
        }
    }
}
