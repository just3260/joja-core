import Foundation

public struct ProductInventoryAPIModel: Codable, Hashable, Sendable {

    public let id: UUID
    public let templateId: UUID
    public let serialNumber: String
    public let status: InventoryStatus
    public let location: TypeAPIModel.Location
    public let actualPrice: Int?
    public let condition: String?
    public let note: String?
    public let manufacturedAt: Date?
    public let createdAt: Date?
    public let updatedAt: Date?
    public let log: String?

    // 巢狀的模板資訊（用於詳細檢視）
    public let template: ProductTemplateAPIModel.ListData?

    public init(
        id: UUID,
        templateId: UUID,
        serialNumber: String,
        status: InventoryStatus,
        location: TypeAPIModel.Location,
        actualPrice: Int?,
        condition: String?,
        note: String?,
        manufacturedAt: Date?,
        createdAt: Date?,
        updatedAt: Date?,
        log: String?,
        template: ProductTemplateAPIModel.ListData?
    ) {
        self.id = id
        self.templateId = templateId
        self.serialNumber = serialNumber
        self.status = status
        self.location = location
        self.actualPrice = actualPrice
        self.condition = condition
        self.note = note
        self.manufacturedAt = manufacturedAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.log = log
        self.template = template
    }
}

// MARK: - Inventory Status
extension ProductInventoryAPIModel {
    public enum InventoryStatus: String, Codable, CaseIterable, Hashable, Sendable {
        case available      // 可售
        case reserved       // 已保留（客製化訂單）
        case sold          // 已售出
        case defective     // 瑕疵品
        case display       // 展示品
        case processing    // 製作中

        public var displayName: String {
            switch self {
            case .available:
                return "可售"
            case .reserved:
                return "已保留"
            case .sold:
                return "已售出"
            case .defective:
                return "瑕疵品"
            case .display:
                return "展示品"
            case .processing:
                return "製作中"
            }
        }

        public var canBeSold: Bool {
            self == .available || self == .display
        }
    }
}

extension ProductInventoryAPIModel {
    public struct Request: Codable, Hashable, Sendable {

        public let templateId: UUID
        public let serialNumber: String?
        public let location: TypeAPIModel.Location
        public let actualPrice: Int?
        public let condition: String?
        public let note: String?
        public let manufacturedAt: Date?

        public init(
            templateId: UUID,
            serialNumber: String?,
            location: TypeAPIModel.Location,
            actualPrice: Int?,
            condition: String?,
            note: String?,
            manufacturedAt: Date?
        ) {
            self.templateId = templateId
            self.serialNumber = serialNumber
            self.location = location
            self.actualPrice = actualPrice
            self.condition = condition
            self.note = note
            self.manufacturedAt = manufacturedAt
        }
    }

    public struct UpdateRequest: Codable, Hashable, Sendable {
        public let status: InventoryStatus?
        public let location: TypeAPIModel.Location?
        public let condition: String?
        public let note: String?

        public init(
            status: InventoryStatus?,
            location: TypeAPIModel.Location?,
            condition: String?,
            note: String?
        ) {
            self.status = status
            self.location = location
            self.condition = condition
            self.note = note
        }
    }

    public struct Response: Codable, Hashable, Sendable {

        public let id: UUID
        public let templateId: UUID
        public let serialNumber: String
        public let status: InventoryStatus
        public let location: TypeAPIModel.Location
        public let actualPrice: Int?
        public let condition: String?
        public let note: String?
        public let manufacturedAt: Date?
        public let createdAt: Date?
        public let updatedAt: Date?
        public let log: String?
        public let template: ProductTemplateAPIModel.ListData?

        public init(
            id: UUID,
            templateId: UUID,
            serialNumber: String,
            status: InventoryStatus,
            location: TypeAPIModel.Location,
            actualPrice: Int?,
            condition: String?,
            note: String?,
            manufacturedAt: Date?,
            createdAt: Date?,
            updatedAt: Date?,
            log: String?,
            template: ProductTemplateAPIModel.ListData?
        ) {
            self.id = id
            self.templateId = templateId
            self.serialNumber = serialNumber
            self.status = status
            self.location = location
            self.actualPrice = actualPrice
            self.condition = condition
            self.note = note
            self.manufacturedAt = manufacturedAt
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.log = log
            self.template = template
        }

        public static let sample: ProductInventoryAPIModel.Response = .init(
            id: UUID(),
            templateId: UUID(),
            serialNumber: "sn-101-B-M-001",
            status: .available,
            location: .finish,
            actualPrice: 1500,
            condition: "全新",
            note: "第一批製作",
            manufacturedAt: Calendar.current.date(byAdding: .day, value: -3, to: Date()),
            createdAt: Calendar.current.date(byAdding: .day, value: -3, to: Date()),
            updatedAt: Calendar.current.date(byAdding: .day, value: -1, to: Date()),
            log: "製作完成",
            template: .sample
        )
    }
}

extension ProductInventoryAPIModel {
    public struct ListData: Codable, Hashable, Sendable {
        public let id: UUID
        public let serialNumber: String
        public let status: InventoryStatus
        public let location: TypeAPIModel.Location
        public let templateName: String?
        public let templateSku: String

        public init(
            id: UUID,
            serialNumber: String,
            status: InventoryStatus,
            location: TypeAPIModel.Location,
            templateName: String?,
            templateSku: String
        ) {
            self.id = id
            self.serialNumber = serialNumber
            self.status = status
            self.location = location
            self.templateName = templateName
            self.templateSku = templateSku
        }

        public static let sample: ProductInventoryAPIModel.ListData = .init(
            id: UUID(),
            serialNumber: "sn-101-B-M-001",
            status: .available,
            location: .finish,
            templateName: "日本印花貝蕾帽",
            templateSku: "sn-101-B-M"
        )

        public static func sampleList(page: Int = 1, count: Int = 10) -> [ProductInventoryAPIModel.ListData] {
            return (1...count).map { index in
                ProductInventoryAPIModel.ListData(
                    id: UUID(),
                    serialNumber: "sn-101-B-M-\(String(format: "%03d", index))",
                    status: index % 3 == 0 ? .sold : .available,
                    location: .finish,
                    templateName: "日本印花貝蕾帽",
                    templateSku: "sn-101-B-M"
                )
            }
        }
    }
}

// MARK: - Batch Operations
extension ProductInventoryAPIModel {
    /// 批次創建庫存請求
    public struct BatchCreateRequest: Codable, Hashable, Sendable {
        public let templateId: UUID
        public let quantity: Int
        public let location: TypeAPIModel.Location
        public let actualPrice: Int?
        public let note: String?
        public let manufacturedAt: Date?

        public init(
            templateId: UUID,
            quantity: Int,
            location: TypeAPIModel.Location,
            actualPrice: Int?,
            note: String?,
            manufacturedAt: Date?
        ) {
            self.templateId = templateId
            self.quantity = quantity
            self.location = location
            self.actualPrice = actualPrice
            self.note = note
            self.manufacturedAt = manufacturedAt
        }

        public func validate() throws {
            guard quantity > 0 && quantity <= 100 else {
                throw ValidationError.invalidQuantity
            }
        }
    }

    public enum ValidationError: Error, LocalizedError {
        case invalidQuantity

        public var errorDescription: String? {
            switch self {
            case .invalidQuantity:
                return "Quantity must be between 1 and 100"
            }
        }
    }
}
