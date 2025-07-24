import Foundation

public struct SessionAPIModel: Codable, Hashable, Sendable {
    public let token: String
    public let user: UserAPIModel.Public
    
    public init(token: String, user: UserAPIModel.Public) {
        self.token = token
        self.user = user
    }
    
    static let sample: SessionAPIModel = .init(
        token: "mock_jwt_token_12345",
        user: .sample
    )
}
