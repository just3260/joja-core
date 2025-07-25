import Foundation

public struct TagAPIModel: Codable, Hashable, Sendable {
    
    public let id: UUID
    public let name: String
    public let description: String?
    
    public init(
        id: UUID,
        name: String,
        description: String?
    ) {
        self.id = id
        self.name = name
        self.description = description
    }
}

extension TagAPIModel {
    public struct Request: Codable, Hashable, Sendable {
        public let name: String
        public let description: String?
        
        public init(
            name: String,
            description: String?
        ) {
            self.name = name
            self.description = description
        }
    }
}

extension TagAPIModel {
    public struct Response: Codable, Hashable, Sendable {
        public let id: UUID
        public let name: String
        public let description: String?
        
        public init(
            id: UUID,
            name: String,
            description: String?
        ) {
            self.id = id
            self.name = name
            self.description = description
        }
        
        public static let sample: TagAPIModel.Response = .init(
            id: UUID(),
            name: "sample",
            description: "測試用 tag"
        )
    }
}
