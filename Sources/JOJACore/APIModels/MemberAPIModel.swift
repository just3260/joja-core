import Foundation

public struct MemberAPIModel: Codable, Hashable, Sendable {
    
    public let id: UUID
    public let name: String
    public let phone: String
    public let birthday: Date?
    public let from: TypeAPIModel.WhereToKnow
    public let address: String?
    public let email: String?
    public let note: String?
    public let amount: Int
    public let isVip: Bool
    public let fillAt: Date?
    public let createdAt: Date?
    public let updatedAt: Date?
    public let trades: [TradeAPIModel]?
    
    public init(
        id: UUID,
        name: String,
        phone: String,
        birthday: Date?,
        from: TypeAPIModel.WhereToKnow,
        address: String?,
        email: String?,
        note: String?,
        amount: Int,
        isVip: Bool,
        fillAt: Date?,
        createdAt: Date?,
        updatedAt: Date?,
        trades: [TradeAPIModel]?
    ) {
        self.id = id
        self.name = name
        self.phone = phone
        self.birthday = birthday
        self.from = from
        self.address = address
        self.email = email
        self.note = note
        self.amount = amount
        self.isVip = isVip
        self.fillAt = fillAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.trades = trades
    }
}

extension MemberAPIModel {
    public struct Request: Codable, Hashable, Sendable {
        public let id: UUID?    // 從 candidate 帶來的 id
        public let name: String
        public let phone: String
        public let birthday: Date?
        public let from: TypeAPIModel.WhereToKnow
        public let address: String?
        public let email: String?
        public let note: String?
        public let isVip: Bool
        public let fillAt: Date?
        
        public init(
            id: UUID?,
            name: String,
            phone: String,
            birthday: Date?,
            from: TypeAPIModel.WhereToKnow,
            address: String?,
            email: String?,
            note: String?,
            isVip: Bool,
            fillAt: Date?
        ) {
            self.id = id
            self.name = name
            self.phone = phone
            self.birthday = birthday
            self.from = from
            self.address = address
            self.email = email
            self.note = note
            self.isVip = isVip
            self.fillAt = fillAt
        }
    }
}

extension MemberAPIModel {
    public struct Response: Codable, Hashable, Sendable {
        public let id: UUID
        public let name: String
        public let phone: String
        public let birthday: Date?
        public let from: TypeAPIModel.WhereToKnow
        public let address: String?
        public let email: String?
        public let note: String?
        public let amount: Int
        public let isVip: Bool
        public let fillAt: Date?
        public let createdAt: Date?
        public let updatedAt: Date?
        public let trades: [TradeAPIModel.SimpleTrade]?
        
        public init(
            id: UUID,
            name: String,
            phone: String,
            birthday: Date?,
            from: TypeAPIModel.WhereToKnow,
            address: String?,
            email: String?,
            note: String?,
            amount: Int,
            isVip: Bool,
            fillAt: Date?,
            createdAt: Date?,
            updatedAt: Date?,
            trades: [TradeAPIModel.SimpleTrade]?
        ) {
            self.id = id
            self.name = name
            self.phone = phone
            self.birthday = birthday
            self.from = from
            self.address = address
            self.email = email
            self.note = note
            self.amount = amount
            self.isVip = isVip
            self.fillAt = fillAt
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.trades = trades
        }
        
        public static let sample: MemberAPIModel.Response = .init(
            id: UUID(),
            name: "王大明",
            phone: "0987654321",
            birthday: Calendar.current.date(byAdding: .year, value: -30, to: Date()),
            from: .tainan,
            address: "台北市大安區敦化南路二段216號",
            email: "wang@example.com",
            note: "VIP 會員，偏好高端帽款",
            amount: 16800,
            isVip: true,
            fillAt: Date(),
            createdAt: Calendar.current.date(byAdding: .year, value: -2, to: Date()) ?? Date(),
            updatedAt: Calendar.current.date(byAdding: .day, value: -10, to: Date()),
            trades: []
        )
    }
}

extension MemberAPIModel {
    public struct ListData: Codable, Hashable, Sendable {
        public let id: UUID
        public let name: String
        public let phone: String
        public let amount: Int
        public let isVip: Bool
        public let createdAt: Date?
        
        public init(
            id: UUID,
            name: String,
            phone: String,
            amount: Int,
            isVip: Bool,
            createdAt: Date?
        ) {
            self.id = id
            self.name = name
            self.phone = phone
            self.amount = amount
            self.isVip = isVip
            self.createdAt = createdAt
        }
        
        public static let sample: MemberAPIModel.ListData = .init(
            id: UUID(),
            name: "王大明",
            phone: "0987654321",
            amount: 16800,
            isVip: true,
            createdAt: Calendar.current.date(byAdding: .year, value: -2, to: Date()) ?? Date()
        )
        
        public static func sampleList(page: Int = 1, count: Int = 10) -> [MemberAPIModel.ListData] {
            return (1...count).map { index in
                MemberAPIModel.ListData(
                    id: UUID(),
                    name: "會員 \(index + (page - 1) * count)",
                    phone: "09\(String(format: "%08d", index + 87654321))",
                    amount: Int.random(in: 1000...50000),
                    isVip: Bool.random(),
                    createdAt: Calendar.current.date(byAdding: .month, value: -index, to: Date()) ?? Date()
                )
            }
        }
        
        public static func sampleSearchResults(count: Int = 5) -> [MemberAPIModel.ListData] {
            return (1...count).map { index in
                MemberAPIModel.ListData(
                    id: UUID(),
                    name: "會員 \(index + 1 * count)",
                    phone: "09\(String(format: "%08d", index + 87654321))",
                    amount: Int.random(in: 1000...50000),
                    isVip: Bool.random(),
                    createdAt: Calendar.current.date(byAdding: .month, value: -index, to: Date()) ?? Date()
                )
            }
        }
    }
}
