
import Foundation

public struct TagAPIModel: Codable, Hashable {
    
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
    public struct Request: Codable, Hashable {
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
    public struct Response: Codable, Hashable {
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
}
