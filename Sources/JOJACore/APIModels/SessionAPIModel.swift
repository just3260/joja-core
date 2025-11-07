import Foundation

public struct SessionAPIModel: Codable, Hashable, Sendable {
    public let token: String
    public let refreshToken: String
    public let user: UserAPIModel.Public

    public init(token: String, refreshToken: String, user: UserAPIModel.Public) {
        self.token = token
        self.refreshToken = refreshToken
        self.user = user
    }

    public static let sample: SessionAPIModel = .init(
        token: "mock_jwt_token_12345",
        refreshToken: "mock_refresh_token_67890",
        user: .sample
    )
}
