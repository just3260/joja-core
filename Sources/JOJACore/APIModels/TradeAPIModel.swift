import Foundation

public struct TradeAPIModel: Codable, Hashable, Sendable {

    public let id: UUID
    // DEPRECATED: 保留向後相容，建議使用 items
    public let products: [ProductAPIModel]
    // NEW: 使用 TradeItem 架構
    public let items: [TradeItemAPIModel]
    public let amount: Int
    public let discount: Int?
    public let transactionType: TypeAPIModel.Transaction?
    public let spendingLocation: TypeAPIModel.SpendingLocation?
    public let note: String?
    public let description: String?
    public let buyerID: UUID?
    public let sellerID: UUID?
    public let buyerName: String?
    public let createdAt: Date?
    public let log: String?

    public init(
        id: UUID,
        products: [ProductAPIModel],
        items: [TradeItemAPIModel],
        amount: Int,
        discount: Int?,
        transactionType: TypeAPIModel.Transaction?,
        spendingLocation: TypeAPIModel.SpendingLocation?,
        note: String?,
        description: String?,
        buyerID: UUID?,
        sellerID: UUID?,
        buyerName: String?,
        createdAt: Date?,
        log: String?
    ) {
        self.id = id
        self.products = products
        self.items = items
        self.amount = amount
        self.discount = discount
        self.transactionType = transactionType
        self.spendingLocation = spendingLocation
        self.note = note
        self.description = description
        self.buyerID = buyerID
        self.sellerID = sellerID
        self.buyerName = buyerName
        self.createdAt = createdAt
        self.log = log
    }

    /*
    // 向後相容的初始化方法
    @available(*, deprecated, message: "Use init with items parameter instead")
    public init(
        id: UUID,
        products: [ProductAPIModel],
        amount: Int,
        note: String?,
        description: String?,
        buyerID: UUID?,
        createdAt: Date?
    ) {
        self.id = id
        self.products = products
        self.items = []
        self.amount = amount
        self.note = note
        self.description = description
        self.buyerID = buyerID
        self.createdAt = createdAt
    }
     */
}

extension TradeAPIModel {
    public struct Request: Codable, Hashable, Sendable {
        // DEPRECATED: 保留向後相容，建議使用 items
        public let products: [ProductAPIModel.Request]?
        // NEW: 使用 TradeItem 架構
        public let items: [TradeItemAPIModel.Request]
        public let amount: Int
        public let discount: Int?
        public let transactionType: TypeAPIModel.Transaction?
        public let spendingLocation: TypeAPIModel.SpendingLocation?
        public let note: String?
        public let description: String?
        public let log: String?
        public let buyerID: UUID?
        public let sellerID: UUID?

        public init(
            products: [ProductAPIModel.Request]?,
            items: [TradeItemAPIModel.Request],
            amount: Int,
            discount: Int?,
            transactionType: TypeAPIModel.Transaction?,
            spendingLocation: TypeAPIModel.SpendingLocation?,
            note: String?,
            description: String?,
            log: String?,
            buyerID: UUID?,
            sellerID: UUID?
        ) {
            self.products = products
            self.items = items
            self.amount = amount
            self.discount = discount
            self.transactionType = transactionType
            self.spendingLocation = spendingLocation
            self.note = note
            self.description = description
            self.log = log
            self.buyerID = buyerID
            self.sellerID = sellerID
        }
    }
    
    public struct Response: Codable, Hashable, Sendable {
        public let id: UUID
        // DEPRECATED: 保留向後相容，建議使用 items
//        public let products: [ProductAPIModel.Response]?
        // NEW: 使用 TradeItem 架構
        public let items: [TradeItemAPIModel.Response]
        public let amount: Int
        public let discount: Int?
        public let transactionType: TypeAPIModel.Transaction?
        public let spendingLocation: TypeAPIModel.SpendingLocation?
        public let note: String?
        public let description: String?
        public let buyerID: UUID?
        public let sellerID: UUID?
        public let buyerName: String?
        public let createdAt: Date?
        public let log: String?

        public init(
            id: UUID,
//            products: [ProductAPIModel.Response]?,
            items: [TradeItemAPIModel.Response],
            amount: Int,
            discount: Int?,
            transactionType: TypeAPIModel.Transaction?,
            spendingLocation: TypeAPIModel.SpendingLocation?,
            note: String?,
            description: String?,
            buyerID: UUID?,
            sellerID: UUID?,
            buyerName: String?,
            createdAt: Date?,
            log: String?
        ) {
            self.id = id
//            self.products = products
            self.items = items
            self.amount = amount
            self.discount = discount
            self.transactionType = transactionType
            self.spendingLocation = spendingLocation
            self.note = note
            self.description = description
            self.buyerID = buyerID
            self.sellerID = sellerID
            self.buyerName = buyerName
            self.createdAt = createdAt
            self.log = log
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


        /// 新式初始化：使用 TradeItem
        public init(
            id: UUID,
            items: [TradeItemAPIModel.Response],
            amount: Int,
            note: String?,
            description: String?,
            buyerID: UUID?,
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
         */

        public static let sample: TradeAPIModel.Response = .init(
            id: UUID(),
            items: TradeItemAPIModel.Response.sampleList(count: 2),
            amount: 3360,
            discount: nil,
            transactionType: .apply_pay,
            spendingLocation: .tainan,
            note: "Mock 交易記錄",
            description: "假資料",
            buyerID: UUID(),
            sellerID: UUID(),
            buyerName: "王大明",
            createdAt: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(),
            log: nil
        )

        public static func sampleList(count: Int = 3) -> [TradeAPIModel.Response] {
            return (1...count).map { index in
                TradeAPIModel.Response(
                    id: UUID(),
                    items: TradeItemAPIModel.Response.sampleList(count: 3),
                    amount: 1680 * index,
                    discount: nil,
                    transactionType: .apply_pay,
                    spendingLocation: .tainan,
                    note: "Mock 交易記錄 \(index)",
                    description: "假資料 \(index)",
                    buyerID: UUID(),
                    sellerID: UUID(),
                    buyerName: "王大明",
                    createdAt: Calendar.current.date(byAdding: .day, value: -index * 7, to: Date()) ?? Date(),
                    log: nil
                )
            }
        }
    }

    public struct ListData: Codable, Hashable, Sendable {
        public let id: UUID
        public let amount: Int
        public let transactionType: TypeAPIModel.Transaction?
        public let spendingLocation: TypeAPIModel.SpendingLocation?
        public let buyerID: UUID?
        public let createdAt: Date?

        public init(
            id: UUID,
            amount: Int,
            transactionType: TypeAPIModel.Transaction?,
            spendingLocation: TypeAPIModel.SpendingLocation?,
            buyerID: UUID?,
            createdAt: Date?
        ) {
            self.id = id
            self.amount = amount
            self.transactionType = transactionType
            self.spendingLocation = spendingLocation
            self.buyerID = buyerID
            self.createdAt = createdAt
        }

        public static let sample: TradeAPIModel.ListData = .init(
            id: UUID(),
            amount: 16800,
            transactionType: .cash,
            spendingLocation: .tainan,
            buyerID: UUID(),
            createdAt: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date()
        )

        public static func sampleList(count: Int = 3) -> [TradeAPIModel.ListData] {
            return (1...count).map { index in
                TradeAPIModel.ListData(
                    id: UUID(),
                    amount: 1680 * index,
                    transactionType: .cash,
                    spendingLocation: .tainan,
                    buyerID: UUID(),
                    createdAt: Calendar.current.date(byAdding: .day, value: -index * 7, to: Date()) ?? Date()
                )
            }
        }
    }

    public struct SimpleTrade: Codable, Hashable, Sendable {
        public let id: UUID
        public let amount: Int
        public let items: [ProductInventoryAPIModel.Response]
        public let note: String?
        public let description: String?
        public let buyerID: UUID?
        public let createdAt: Date?
        
        public init(
            id: UUID,
            amount: Int,
            items: [ProductInventoryAPIModel.Response],
            note: String?,
            description: String?,
            buyerID: UUID?,
            createdAt: Date?
        ) {
            self.id = id
            self.amount = amount
            self.items = items
            self.note = note
            self.description = description
            self.buyerID = buyerID
            self.createdAt = createdAt
        }
        
        public static let sample: TradeAPIModel.SimpleTrade = .init(
            id: UUID(),
            amount: 16800,
            items: [ProductInventoryAPIModel.Response.sample],
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
                    items: [ProductInventoryAPIModel.Response.sample],
                    note: "Mock 交易記錄",
                    description: "假資料",
                    buyerID: UUID(),
                    createdAt: Calendar.current.date(byAdding: .day, value: -index * 7, to: Date()) ?? Date()
                )
            }
        }
    }
}
