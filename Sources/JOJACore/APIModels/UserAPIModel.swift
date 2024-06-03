
import Foundation

public struct PermissionOptions: OptionSet, Codable, Hashable {
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public let rawValue: Int
    
    public static let transaction = PermissionOptions(rawValue: 1 << 0)
    // candidate
    public static let deleteCandidate = PermissionOptions(rawValue: 1 << 1)
    // member
    public static let createMember = PermissionOptions(rawValue: 1 << 2)
    public static let editMember = PermissionOptions(rawValue: 1 << 3)
    public static let deleteMember = PermissionOptions(rawValue: 1 << 4)
    // trade
    public static let createTrade = PermissionOptions(rawValue: 1 << 5)
    public static let deleteTrade = PermissionOptions(rawValue: 1 << 6)
}

public struct UserAPIModel: Codable, Hashable {
    
    public let id: UUID
    public let username: String
    public let email: String
    public let isAdmin: Bool
    public let permissions: PermissionOptions
    public let password: String
    public let createdAt: Date
    public let updatedAt: Date
    
    public init(id: UUID, username: String, email: String, password: String, isAdmin: Bool, permissions: PermissionOptions, createdAt: Date, updatedAt: Date) {
        self.id = id
        self.username = username
        self.email = email
        self.password = password
        self.isAdmin = isAdmin
        self.permissions = permissions
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

extension UserAPIModel {
    public struct Create: Codable, Hashable {
        
        public let username: String
        public let email: String
        public let password: String
        
        public init(username: String, email: String, password: String) {
            self.username = username
            self.email = email
            self.password = password
        }
        
        public init(signup: SignupAPIModel) {
            self.username = signup.username
            self.email = signup.email
            self.password = signup.password
        }
    }
}

extension UserAPIModel {
    public struct Public: Codable, Hashable {
        public let id: UUID
        public let username: String
        public let email: String
        public let isAdmin: Bool
        public let permissions: PermissionOptions
        public let createdAt: Date
        public let updatedAt: Date
        
        public init(id: UUID, username: String, email: String, isAdmin: Bool, permissions: PermissionOptions, createdAt: Date, updatedAt: Date) {
            self.id = id
            self.username = username
            self.email = email
            self.isAdmin = isAdmin
            self.permissions = permissions
            self.createdAt = createdAt
            self.updatedAt = updatedAt
        }
    }
}
