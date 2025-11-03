import Foundation

public struct ProductInventoryAPIModel: Codable, Hashable, Sendable {

    public let id: UUID
    public let templateId: UUID
    public let serialNumber: String
    public let status: TypeAPIModel.InventoryStatus
    public let location: TypeAPIModel.Location
    public let actualPrice: Int?
    public let condition: String?
    public let note: String?
    public let createdAt: Date?
    public let updatedAt: Date?
    public let log: String?

    // 巢狀的模板資訊（用於詳細檢視）
    public let template: ProductTemplateAPIModel.ListData?

    public init(
        id: UUID,
        templateId: UUID,
        serialNumber: String,
        status: TypeAPIModel.InventoryStatus,
        location: TypeAPIModel.Location,
        actualPrice: Int?,
        condition: String?,
        note: String?,
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
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.log = log
        self.template = template
    }
}

extension ProductInventoryAPIModel {
    public struct Request: Codable, Hashable, Sendable {

        public let templateId: UUID
        public let location: TypeAPIModel.Location
        public let actualPrice: Int?
        public let condition: String?
        public let note: String?

        public init(
            templateId: UUID,
            location: TypeAPIModel.Location,
            actualPrice: Int?,
            condition: String?,
            note: String?,
        ) {
            self.templateId = templateId
            self.location = location
            self.actualPrice = actualPrice
            self.condition = condition
            self.note = note
        }
    }

    public struct UpdateRequest: Codable, Hashable, Sendable {
        public let status: TypeAPIModel.InventoryStatus?
        public let location: TypeAPIModel.Location?
        public let condition: String?
        public let note: String?

        public init(
            status: TypeAPIModel.InventoryStatus?,
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
        public let status: TypeAPIModel.InventoryStatus
        public let location: TypeAPIModel.Location
        public let actualPrice: Int?
        public let condition: String?
        public let note: String?
        public let createdAt: Date?
        public let updatedAt: Date?
        public let log: String?
//        public let template: ProductTemplateAPIModel.ListData?

        public init(
            id: UUID,
            templateId: UUID,
            serialNumber: String,
            status: TypeAPIModel.InventoryStatus,
            location: TypeAPIModel.Location,
            actualPrice: Int?,
            condition: String?,
            note: String?,
            createdAt: Date?,
            updatedAt: Date?,
            log: String?,
//            template: ProductTemplateAPIModel.ListData?
        ) {
            self.id = id
            self.templateId = templateId
            self.serialNumber = serialNumber
            self.status = status
            self.location = location
            self.actualPrice = actualPrice
            self.condition = condition
            self.note = note
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.log = log
//            self.template = template
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
            createdAt: Calendar.current.date(byAdding: .day, value: -3, to: Date()),
            updatedAt: Calendar.current.date(byAdding: .day, value: -1, to: Date()),
            log: "製作完成",
//            template: .sample
        )
    }
}

extension ProductInventoryAPIModel {
    public struct ListData: Codable, Hashable, Sendable {
        public let id: UUID
        public let serialNumber: String
        public let status: TypeAPIModel.InventoryStatus
        public let location: TypeAPIModel.Location
        public let templateSku: String

        public init(
            id: UUID,
            serialNumber: String,
            status: TypeAPIModel.InventoryStatus,
            location: TypeAPIModel.Location,
            templateSku: String
        ) {
            self.id = id
            self.serialNumber = serialNumber
            self.status = status
            self.location = location
            self.templateSku = templateSku
        }

        public static let sample: ProductInventoryAPIModel.ListData = .init(
            id: UUID(),
            serialNumber: "sn-101-B-M-001",
            status: .available,
            location: .finish,
            templateSku: "sn-101-B-M"
        )

        public static func sampleList(page: Int = 1, count: Int = 10) -> [ProductInventoryAPIModel.ListData] {
            return (1...count).map { index in
                ProductInventoryAPIModel.ListData(
                    id: UUID(),
                    serialNumber: "sn-101-B-M-\(String(format: "%03d", index))",
                    status: index % 3 == 0 ? .sold : .available,
                    location: .finish,
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

        public init(
            templateId: UUID,
            quantity: Int,
            location: TypeAPIModel.Location,
            actualPrice: Int?,
            note: String?
        ) {
            self.templateId = templateId
            self.quantity = quantity
            self.location = location
            self.actualPrice = actualPrice
            self.note = note
        }
        
        public static let sample: ProductInventoryAPIModel.BatchCreateRequest = .init(
            templateId: UUID(),
            quantity: 3,
            location: .tainan,
            actualPrice: 1680,
            note: "測試庫存"
        )
    }
}
