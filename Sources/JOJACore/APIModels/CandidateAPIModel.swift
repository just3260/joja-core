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
    }
}