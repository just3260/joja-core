import Foundation

public struct TradeAPIModel: Codable, Hashable, Sendable {

    public let id: UUID
    // DEPRECATED: 保留向後相容，建議使用 items
    public let products: [ProductAPIModel]
    // NEW: 使用 TradeItem 架構
    public let items: [TradeItemAPIModel]?
    public let amount: Int
    public let note: String?
    public let description: String?
    public let buyerID: UUID
    public let createdAt: Date?

    public init(
        id: UUID,
        products: [ProductAPIModel],
        items: [TradeItemAPIModel]?,
        amount: Int,
        note: String?,
        description: String?,
        buyerID: UUID,
        createdAt: Date?
    ) {
        self.id = id
        self.products = products
        self.items = items
        self.amount = amount
        self.note = note
        self.description = description
        self.buyerID = buyerID
        self.createdAt = createdAt
    }

    // 向後相容的初始化方法
    @available(*, deprecated, message: "Use init with items parameter instead")
    public init(
        id: UUID,
        products: [ProductAPIModel],
        amount: Int,
        note: String?,
        description: String?,
        buyerID: UUID,
        createdAt: Date?
    ) {
        self.id = id
        self.products = products
        self.items = nil
        self.amount = amount
        self.note = note
        self.description = description
        self.buyerID = buyerID
        self.createdAt = createdAt
    }
}

extension TradeAPIModel {
    public struct Request: Codable, Hashable, Sendable {
//        public let id: UUID?
        // DEPRECATED: 保留向後相容，建議使用 items
        public let products: [ProductAPIModel.Request]?
        // NEW: 使用 TradeItem 架構
        public let items: [TradeItemAPIModel.Request]?
        // 舊的架構，新架構折扣是否改在 TradeItemAPIModel.Request 底下？
        public let discount: Int?
        public let note: String?
        public let description: String?
        public let buyerID: UUID

        public init(
//            id: UUID?,
            products: [ProductAPIModel.Request]?,
            items: [TradeItemAPIModel.Request]?,
            discount: Int?,
            note: String?,
            description: String?,
            buyerID: UUID
        ) {
//            self.id = id
            self.products = products
            self.items = items
            self.discount = discount
            self.note = note
            self.description = description
            self.buyerID = buyerID
        }

        // 向後相容的初始化方法
        @available(*, deprecated, message: "Use init with items parameter instead")
        public init(
//            id: UUID?,
            products: [ProductAPIModel.Request],
            discount: Int?,
            note: String?,
            buyerID: UUID
        ) {
//            self.id = id
            self.products = products
            self.items = nil
            self.discount = discount
            self.note = note
            self.description = nil
            self.buyerID = buyerID
        }

        /// 新式初始化：使用 TradeItem
        public init(
//            id: UUID?,
            items: [TradeItemAPIModel.Request],
            note: String?,
            description: String?,
            buyerID: UUID
        ) {
//            self.id = id
            self.products = nil
            self.items = items
            self.discount = nil
            self.note = note
            self.description = description
            self.buyerID = buyerID
        }
    }
    
    public struct Response: Codable, Hashable, Sendable {
        public let id: UUID
        // DEPRECATED: 保留向後相容，建議使用 items
//        public let products: [ProductAPIModel.Response]?
        // NEW: 使用 TradeItem 架構
        public let items: [TradeItemAPIModel.Response]?
        public let amount: Int
        public let note: String?
        public let description: String?
        public let buyerID: UUID
        public let createdAt: Date?

        public init(
            id: UUID,
//            products: [ProductAPIModel.Response]?,
            items: [TradeItemAPIModel.Response]?,
            amount: Int,
            note: String?,
            description: String?,
            buyerID: UUID,
            createdAt: Date?
        ) {
            self.id = id
//            self.products = products
            self.items = items
            self.amount = amount
            self.note = note
            self.description = description
            self.buyerID = buyerID
            self.createdAt = createdAt
        }

        /*
        // 向後相容的初始化方法
        @available(*, deprecated, message: "Use init with items parameter instead")
        public init(
            id: UUID,
            products: [ProductAPIModel.Response],
            amount: Int,
            note: String?,
            description: String?,
            buyerID: UUID,
            createdAt: Date?
        ) {
            self.id = id
            self.products = products
            self.items = nil
            self.amount = amount
            self.note = note
            self.description = description
            self.buyerID = buyerID
            self.createdAt = createdAt
        }
         */

        /// 新式初始化：使用 TradeItem
        public init(
            id: UUID,
            items: [TradeItemAPIModel.Response],
            amount: Int,
            note: String?,
            description: String?,
            buyerID: UUID,
            createdAt: Date?
        ) {
            self.id = id
            self.items = items
            self.amount = amount
            self.note = note
            self.description = description
            self.buyerID = buyerID
            self.createdAt = createdAt
        }

        public static let sample: TradeAPIModel.Response = .init(
            id: UUID(),
            items: TradeItemAPIModel.ListData.sampleList(count: 2).map { listData in
                TradeItemAPIModel.Response(
                    id: listData.id,
                    tradeId: UUID(),
                    inventoryId: UUID(),
                    quantity: listData.quantity,
                    unitPrice: listData.unitPrice,
                    discount: listData.discount,
                    subtotal: listData.subtotal,
                    note: nil,
                    createdAt: Date(),
                    inventory: .sample
                )
            },
            amount: 3360,
            note: "Mock 交易記錄",
            description: "假資料",
            buyerID: UUID(),
            createdAt: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date()
        )

        public static func sampleList(count: Int = 3) -> [TradeAPIModel.Response] {
            return (1...count).map { index in
                TradeAPIModel.Response(
                    id: UUID(),
                    items: TradeItemAPIModel.ListData.sampleList(count: 2).map { listData in
                        TradeItemAPIModel.Response(
                            id: listData.id,
                            tradeId: UUID(),
                            inventoryId: UUID(),
                            quantity: listData.quantity,
                            unitPrice: listData.unitPrice,
                            discount: listData.discount,
                            subtotal: listData.subtotal,
                            note: nil,
                            createdAt: Date(),
                            inventory: .sample
                        )
                    },
                    amount: 1680 * index,
                    note: "Mock 交易記錄 \(index)",
                    description: "假資料 \(index)",
                    buyerID: UUID(),
                    createdAt: Calendar.current.date(byAdding: .day, value: -index * 7, to: Date()) ?? Date()
                )
            }
        }
    }
    
    public struct SimpleTrade: Codable, Hashable, Sendable {
        public let id: UUID
        public let amount: Int
        public let note: String?
        public let description: String?
        public let buyerID: UUID
        public let createdAt: Date?
        
        public init(
            id: UUID,
            amount: Int,
            note: String?,
            description: String?,
            buyerID: UUID,
            createdAt: Date?
        ) {
            self.id = id
            self.amount = amount
            self.note = note
            self.description = description
            self.buyerID = buyerID
            self.createdAt = createdAt
        }
        
        public static let sample: TradeAPIModel.SimpleTrade = .init(
            id: UUID(),
            amount: 16800,
            note: "Mock 交易記錄",
            description: "假資料",
            buyerID: UUID(),
            createdAt: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date()
        )
        
        public static func sampleList(count: Int = 3) -> [TradeAPIModel.SimpleTrade] {
            return (1...count).map { index in
                TradeAPIModel.SimpleTrade(
                    id: UUID(),
                    amount: 1680 * index,
                    note: "Mock 交易記錄 \(index)",
                    description: "假資料 \(index)",
                    buyerID: UUID(),
                    createdAt: Calendar.current.date(byAdding: .day, value: -index * 7, to: Date()) ?? Date()
                )
            }
        }
    }
}
