import Foundation

public struct CandidateAPIModel: Codable, Hashable, Sendable {
    
    public let id: UUID
    public let name: String
    public let phone: String
    public let birthday: Date?
    public let from: TypeAPIModel.WhereToKnow
    public let address: String?
    public let email: String?
    public let note: String?
    public let createdAt: Date?
    
    public init(
        id: UUID,
        name: String,
        phone: String,
        birthday: Date?,
        from: TypeAPIModel.WhereToKnow,
        address: String?,
        email: String?,
        note: String?,
        createdAt: Date?
    ) {
        self.id = id
        self.name = name
        self.phone = phone
        self.birthday = birthday
        self.from = from
        self.address = address
        self.email = email
        self.note = note
        self.createdAt = createdAt
    }
}

extension CandidateAPIModel {
    public struct Request: Codable, Hashable, Sendable {
        public let name: String
        public let phone: String
        public let birthday: String?
        public let from: TypeAPIModel.WhereToKnow
        public let address: String?
        public let email: String?
        public let note: String?
        
        public init(
            name: String,
            phone: String,
            birthday: String?,
            from: TypeAPIModel.WhereToKnow,
            address: String?,
            email: String?,
            note: String?
        ) {
            self.name = name
            self.phone = phone
            self.birthday = birthday
            self.from = from
            self.address = address
            self.email = email
            self.note = note
        }
    }
}

extension CandidateAPIModel {
    public struct Response: Codable, Hashable, Sendable {
        public let id: UUID
        public let name: String
        public let phone: String
        public let birthday: Date?
        public let from: TypeAPIModel.WhereToKnow
        public let address: String?
        public let email: String?
        public let note: String?
        public let createdAt: Date?
        
        public init(
            id: UUID,
            name: String,
            phone: String,
            birthday: Date?,
            from: TypeAPIModel.WhereToKnow,
            address: String?,
            email: String?,
            note: String?,
            createdAt: Date?
        ) {
            self.id = id
            self.name = name
            self.phone = phone
            self.birthday = birthday
            self.from = from
            self.address = address
            self.email = email
            self.note = note
            self.createdAt = createdAt
        }
        
        public static let sample: CandidateAPIModel.Response = .init(
            id: UUID(),
            name: "張小明",
            phone: "0912345678",
            birthday: Calendar.current.date(byAdding: .year, value: -25, to: Date()),
            from: .tainan,
            address: "台北市中正區重慶南路一段122號",
            email: "zhang@example.com",
            note: "透過朋友介紹認識，對高品質帽子有興趣",
            createdAt: Calendar.current.date(byAdding: .day, value: -7, to: Date()) ?? Date()
        )
    }
}

extension CandidateAPIModel {
    public struct ListData: Codable, Hashable, Sendable {
        public let id: UUID
        public let name: String
        public let phone: String
        public let createdAt: Date?
        
        public init(
            id: UUID,
            name: String,
            phone: String,
            createdAt: Date?
        ) {
            self.id = id
            self.name = name
            self.phone = phone
            self.createdAt = createdAt
        }
        
        public static let sample: CandidateAPIModel.ListData = .init(
            id: UUID(),
            name: "王大明",
            phone: "0912345678",
            createdAt: Calendar.current.date(byAdding: .day, value: -7, to: Date())
        )
        
        public static func sampleList(page: Int = 1, count: Int = 10) -> [CandidateAPIModel.ListData] {
            return (1...count).map { index in
                CandidateAPIModel.ListData(
                    id: UUID(),
                    name: "候選會員 \(index + (page - 1) * count)",
                    phone: "09\(String(format: "%08d", index + 12345678))",
                    createdAt: Calendar.current.date(byAdding: .day, value: -index, to: Date())
                )
            }
        }
    }
}
