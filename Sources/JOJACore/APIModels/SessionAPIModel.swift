import Foundation

public struct SessionAPIModel: Codable, Hashable, Sendable {
    public let token: String
    public let user: UserAPIModel.Public
    
    public init(token: String, user: UserAPIModel.Public) {
        self.token = token
        self.user = user
    }
}