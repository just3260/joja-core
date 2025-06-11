import Foundation

public struct PermissionOptions: OptionSet, Codable, Hashable, Sendable {
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public let rawValue: Int
    
    public static let transaction = PermissionOptions(rawValue: 1 << 0) // 1
    // candidate
    public static let deleteCandidate = PermissionOptions(rawValue: 1 << 1) // 2
    // member
    public static let createMember = PermissionOptions(rawValue: 1 << 2) // 4
    public static let editMember = PermissionOptions(rawValue: 1 << 3) // 8
    public static let deleteMember = PermissionOptions(rawValue: 1 << 4) // 16
    // trade
    public static let createTrade = PermissionOptions(rawValue: 1 << 5) // 32
    public static let deleteTrade = PermissionOptions(rawValue: 1 << 6) // 64
    // product
    public static let readProduct = PermissionOptions(rawValue: 1 << 7) // 128
    public static let createProduct = PermissionOptions(rawValue: 1 << 8) // 256
    public static let editProduct = PermissionOptions(rawValue: 1 << 9) // 512
    public static let deleteProduct = PermissionOptions(rawValue: 1 << 10) // 1024
    // tag
    public static let createTag = PermissionOptions(rawValue: 1 << 8) // 256
    public static let editTag = PermissionOptions(rawValue: 1 << 9) // 512
    public static let deleteTag = PermissionOptions(rawValue: 1 << 10) // 1024
}

public struct UserAPIModel: Codable, Hashable, Sendable {
    
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
    public struct Create: Codable, Hashable, Sendable {
        
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
    public struct Public: Codable, Hashable, Sendable {
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