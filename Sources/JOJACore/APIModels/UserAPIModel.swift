import Foundation

public struct PermissionOptions: OptionSet, Codable, Hashable, Sendable {
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    /*
     權限表：
     候選會員、會員、交易、布料、商品、Tag

     admin: 127
        - 所有權限
        - 所有刪除權限

     staff: 0
        - 所有讀取權限（不包含布料特殊資料）

     jn: 30
        - 所有讀取權限（不包含布料特殊資料）
        - 會員資料變更
        - 交易資料變更
        - 商品新增
        - 商品更新

     */

    public let rawValue: Int

    // 備用欄位
    public static let pending = PermissionOptions(rawValue: 1 << 0) // 1
    // member
    public static let editMember = PermissionOptions(rawValue: 1 << 1) // 2
    // trade
    public static let editTrade = PermissionOptions(rawValue: 1 << 2) // 4
    // product
    public static let createProduct = PermissionOptions(rawValue: 1 << 3) // 8
    public static let editProduct = PermissionOptions(rawValue: 1 << 4) // 16
    public static let transferProduct = PermissionOptions(rawValue: 1 << 5) // 32
    // tag (暫時用不到)
    public static let createTag = PermissionOptions(rawValue: 1 << 6) // 64
    public static let editTag = PermissionOptions(rawValue: 1 << 7) // 128

    // 7: 128
    // 8: 256
    // 9: 512
    // 10: 1024
    // 11: 2048
    // 12: 4096
    // 13: 8192

    // 布料管理權限
    public static let fabric = PermissionOptions(rawValue: 1 << 14) // 16384
    // 刪除權限
    public static let delete = PermissionOptions(rawValue: 1 << 15) // 32768
}

public struct UserAPIModel: Codable, Hashable, Sendable {
    
    public let id: UUID
    public let username: String
    public let email: String
    public let isAdmin: Bool
    public let serviceLocation: [TypeAPIModel.SpendingLocation]
    public let permissions: PermissionOptions
    public let password: String
    public let statistics: StatisticsAPIModel
    public let createdAt: Date
    public let updatedAt: Date
    
    public init(id: UUID, username: String, email: String, password: String, isAdmin: Bool, serviceLocation: [TypeAPIModel.SpendingLocation], permissions: PermissionOptions, statistics: StatisticsAPIModel, createdAt: Date, updatedAt: Date) {
        self.id = id
        self.username = username
        self.email = email
        self.password = password
        self.isAdmin = isAdmin
        self.serviceLocation = serviceLocation
        self.permissions = permissions
        self.statistics = statistics
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
        public let serviceLocation: [TypeAPIModel.SpendingLocation]
        public let permissions: PermissionOptions
        public let statistics: StatisticsAPIModel
        public let createdAt: Date
        public let updatedAt: Date
        
        public init(id: UUID, username: String, email: String, isAdmin: Bool, serviceLocation: [TypeAPIModel.SpendingLocation], permissions: PermissionOptions, statistics: StatisticsAPIModel, createdAt: Date, updatedAt: Date) {
            self.id = id
            self.username = username
            self.email = email
            self.isAdmin = isAdmin
            self.serviceLocation = serviceLocation
            self.permissions = permissions
            self.statistics = statistics
            self.createdAt = createdAt
            self.updatedAt = updatedAt
        }
        
        public static let sample: UserAPIModel.Public = .init(
            id: UUID(),
            username: "test_user",
            email: "test@example.com",
            isAdmin: false,
            serviceLocation: [.ig],
            permissions: PermissionOptions(rawValue: 37),
            statistics: .sample,
            createdAt: Date(),
            updatedAt: Date()
        )
    }
}
