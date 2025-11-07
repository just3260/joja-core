import Foundation

public struct TokenAPIModel: Codable, Hashable, Sendable {
    
    public enum SessionSource: Int, Codable, Hashable, Sendable {
        case signup
        case login
        case refresh
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
    public struct Create: Codable, Hashable, Sendable {
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