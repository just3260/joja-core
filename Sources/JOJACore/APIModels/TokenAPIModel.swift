
import Foundation

public struct TokenAPIModel: Codable, Hashable {
    
    public enum SessionSource: Int, Codable, Hashable {
        case signup
        case login
    }
    
    public let id: UUID
    public let user: UserAPIModel
    public let value: String
    public let source: SessionSource
    public let expiresAt: Date
    public let createdAt: Date
    
    public init(id: UUID, user: UserAPIModel, value: String, source: SessionSource, expiresAt: Date, createdAt: Date) {
        self.id = id
        self.user = user
        self.value = value
        self.source = source
        self.expiresAt = expiresAt
        self.createdAt = createdAt
    }
}

extension TokenAPIModel {
    public struct Create: Codable, Hashable {
        public let user: UserAPIModel
        public let value: String
        public let source: SessionSource
        
        public init(user: UserAPIModel, value: String, source: SessionSource) {
            self.user = user
            self.value = value
            self.source = source
        }
    }
}
