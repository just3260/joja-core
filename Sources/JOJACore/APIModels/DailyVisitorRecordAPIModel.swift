import Foundation

public struct DailyVisitorRecordAPIModel: Codable, Hashable, Sendable {

    public let id: UUID
    public let storeLocation: TypeAPIModel.StoreLocation
    public let recordDate: Date
    public let regularCustomerCount: Int
    public let passersbyCount: Int
    public let weather: String?
    public let specialEvent: String?
    public let note: String?
    public let recordedByUserId: UUID?
    public let createdAt: Date?
    public let updatedAt: Date?

    public init(
        id: UUID,
        storeLocation: TypeAPIModel.StoreLocation,
        recordDate: Date,
        regularCustomerCount: Int,
        passersbyCount: Int,
        weather: String? = nil,
        specialEvent: String? = nil,
        note: String? = nil,
        recordedByUserId: UUID? = nil,
        createdAt: Date? = nil,
        updatedAt: Date? = nil
    ) {
        self.id = id
        self.storeLocation = storeLocation
        self.recordDate = recordDate
        self.regularCustomerCount = regularCustomerCount
        self.passersbyCount = passersbyCount
        self.weather = weather
        self.specialEvent = specialEvent
        self.note = note
        self.recordedByUserId = recordedByUserId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

// MARK: - Request
extension DailyVisitorRecordAPIModel {
    public struct Request: Codable, Hashable, Sendable {
        public let storeLocation: TypeAPIModel.StoreLocation
        public let recordDate: Date
        public let regularCustomerCount: Int
        public let passersbyCount: Int
        public let weather: String?
        public let specialEvent: String?
        public let note: String?

        public init(
            storeLocation: TypeAPIModel.StoreLocation,
            recordDate: Date,
            regularCustomerCount: Int,
            passersbyCount: Int,
            weather: String? = nil,
            specialEvent: String? = nil,
            note: String? = nil
        ) {
            self.storeLocation = storeLocation
            self.recordDate = recordDate
            self.regularCustomerCount = regularCustomerCount
            self.passersbyCount = passersbyCount
            self.weather = weather
            self.specialEvent = specialEvent
            self.note = note
        }
    }
}

// MARK: - Response
extension DailyVisitorRecordAPIModel {
    public struct Response: Codable, Hashable, Sendable {
        public let id: UUID
        public let storeLocation: TypeAPIModel.StoreLocation
        public let recordDate: Date
        public let regularCustomerCount: Int
        public let passersbyCount: Int
        public let totalCount: Int
        public let weather: String?
        public let specialEvent: String?
        public let note: String?
        public let recordedByUserId: UUID?
        public let createdAt: Date?
        public let updatedAt: Date?

        public init(
            id: UUID,
            storeLocation: TypeAPIModel.StoreLocation,
            recordDate: Date,
            regularCustomerCount: Int,
            passersbyCount: Int,
            weather: String? = nil,
            specialEvent: String? = nil,
            note: String? = nil,
            recordedByUserId: UUID? = nil,
            createdAt: Date? = nil,
            updatedAt: Date? = nil
        ) {
            self.id = id
            self.storeLocation = storeLocation
            self.recordDate = recordDate
            self.regularCustomerCount = regularCustomerCount
            self.passersbyCount = passersbyCount
            self.totalCount = regularCustomerCount + passersbyCount
            self.weather = weather
            self.specialEvent = specialEvent
            self.note = note
            self.recordedByUserId = recordedByUserId
            self.createdAt = createdAt
            self.updatedAt = updatedAt
        }

        public static let sample: DailyVisitorRecordAPIModel.Response = .init(
            id: UUID(),
            storeLocation: .taipei,
            recordDate: Date(),
            regularCustomerCount: 10,
            passersbyCount: 5,
            weather: "晴天",
            specialEvent: nil,
            note: "今天人流正常",
            recordedByUserId: nil,
            createdAt: Date(),
            updatedAt: nil
        )
    }
}

// MARK: - ListData
extension DailyVisitorRecordAPIModel {
    public struct ListData: Codable, Hashable, Sendable {
        public let id: UUID
        public let storeLocation: TypeAPIModel.StoreLocation
        public let recordDate: Date
        public let regularCustomerCount: Int
        public let passersbyCount: Int
        public let totalCount: Int

        public init(
            id: UUID,
            storeLocation: TypeAPIModel.StoreLocation,
            recordDate: Date,
            regularCustomerCount: Int,
            passersbyCount: Int
        ) {
            self.id = id
            self.storeLocation = storeLocation
            self.recordDate = recordDate
            self.regularCustomerCount = regularCustomerCount
            self.passersbyCount = passersbyCount
            self.totalCount = regularCustomerCount + passersbyCount
        }
    }
}

// MARK: - Statistics
extension DailyVisitorRecordAPIModel {
    public struct Statistics: Codable, Hashable, Sendable {
        public let storeLocation: TypeAPIModel.StoreLocation?
        public let startDate: Date
        public let endDate: Date
        public let totalRegularCustomers: Int
        public let totalPassersby: Int
        public let totalVisitors: Int
        public let averageRegularCustomersPerDay: Double
        public let averagePassersbyPerDay: Double
        public let averageVisitorsPerDay: Double
        public let recordCount: Int
        public let regularCustomerRatio: Double
        public let passersbyRatio: Double

        public init(
            storeLocation: TypeAPIModel.StoreLocation?,
            startDate: Date,
            endDate: Date,
            totalRegularCustomers: Int,
            totalPassersby: Int,
            recordCount: Int
        ) {
            self.storeLocation = storeLocation
            self.startDate = startDate
            self.endDate = endDate
            self.totalRegularCustomers = totalRegularCustomers
            self.totalPassersby = totalPassersby
            self.totalVisitors = totalRegularCustomers + totalPassersby
            self.recordCount = recordCount

            let dayCount = Double(recordCount > 0 ? recordCount : 1)
            self.averageRegularCustomersPerDay = Double(totalRegularCustomers) / dayCount
            self.averagePassersbyPerDay = Double(totalPassersby) / dayCount
            self.averageVisitorsPerDay = Double(totalVisitors) / dayCount

            let total = Double(totalVisitors > 0 ? totalVisitors : 1)
            self.regularCustomerRatio = Double(totalRegularCustomers) / total
            self.passersbyRatio = Double(totalPassersby) / total
        }

        public static let sample: DailyVisitorRecordAPIModel.Statistics = .init(
            storeLocation: .taipei,
            startDate: Date(),
            endDate: Date(),
            totalRegularCustomers: 300,
            totalPassersby: 150,
            recordCount: 30
        )
    }
}
