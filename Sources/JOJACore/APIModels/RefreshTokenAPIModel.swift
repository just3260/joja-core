import Foundation

public struct RefreshTokenAPIModel: Codable, Hashable, Sendable {

    public let id: UUID
    public let userID: UUID
    public let token: String
    public let expiresAt: Date
    public let createdAt: Date
    public let isRevoked: Bool

    public init(id: UUID, userID: UUID, token: String, expiresAt: Date, createdAt: Date, isRevoked: Bool) {
        self.id = id
        self.userID = userID
        self.token = token
        self.expiresAt = expiresAt
        self.createdAt = createdAt
        self.isRevoked = isRevoked
    }
}

extension RefreshTokenAPIModel {
    public struct Create: Codable, Hashable, Sendable {
        public let userID: UUID
        public let token: String
        public let expiresAt: Date

        public init(userID: UUID, token: String, expiresAt: Date) {
            self.userID = userID
            self.token = token
            self.expiresAt = expiresAt
        }
    }
}
