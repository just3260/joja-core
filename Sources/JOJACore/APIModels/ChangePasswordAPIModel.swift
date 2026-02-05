import Foundation

public struct ChangePasswordAPIModel: Codable, Hashable, Sendable {
    public let oldPassword: String
    public let newPassword: String

    public init(oldPassword: String, newPassword: String) {
        self.oldPassword = oldPassword
        self.newPassword = newPassword
    }
}
