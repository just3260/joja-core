import Foundation

public struct RefreshRequestAPIModel: Codable, Hashable, Sendable {
    public let refreshToken: String

    public init(refreshToken: String) {
        self.refreshToken = refreshToken
    }
}
