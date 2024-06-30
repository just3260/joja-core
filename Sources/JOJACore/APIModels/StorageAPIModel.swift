
import Foundation

public struct StorageAPIModel: Codable, Hashable {
    
    public let id: UUID
    public let name: String
    public var location: TypeAPIModel.Location
    public let description: String?
    
    public init(
        id: UUID,
        name: String,
        location: TypeAPIModel.Location,
        description: String?
    ) {
        self.id = id
        self.name = name
        self.location = location
        self.description = description
    }
}

extension StorageAPIModel {
    public struct Request: Codable, Hashable {
//        public let name: String
        public var location: TypeAPIModel.Location
        public let description: String?
        
        public init(
//            name: String,
            location: TypeAPIModel.Location,
            description: String?
        ) {
//            self.name = name
            self.location = location
            self.description = description
        }
    }
}

extension StorageAPIModel {
    public struct Response: Codable, Hashable {
        public let id: UUID
        public let name: String
        public var location: TypeAPIModel.Location
        public let description: String?
        
        public init(
            id: UUID,
            name: String,
            location: TypeAPIModel.Location,
            description: String?
        ) {
            self.id = id
            self.name = name
            self.location = location
            self.description = description
        }
    }
}
