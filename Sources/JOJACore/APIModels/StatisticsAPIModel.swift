
import Foundation

public struct RevenueAPIModel: Codable, Hashable, Sendable {
    public let location: TypeAPIModel.SpendingLocation
    public let todayTransactions: Int
    public let todayRevenue: Int
    public let monthTransactions: Int
    public let monthRevenue: Int

    public init(
        location: TypeAPIModel.SpendingLocation,
        todayTransactions: Int,
        todayRevenue: Int,
        monthTransactions: Int,
        monthRevenue: Int
    ) {
        self.location = location
        self.todayTransactions = todayTransactions
        self.todayRevenue = todayRevenue
        self.monthTransactions = monthTransactions
        self.monthRevenue = monthRevenue
    }

    public static let sample: RevenueAPIModel = .init(
        location: .tainan,
        todayTransactions: 5,
        todayRevenue: 5000,
        monthTransactions: 10,
        monthRevenue: 10000
    )

    public var isTodayEmpty: Bool {
        todayTransactions == 0 && todayRevenue == 0
    }

    public var isMonthEmpty: Bool {
        monthTransactions == 0 && monthRevenue == 0
    }
}

public struct StatisticsAPIModel: Codable, Hashable, Sendable {
    public let candidateCount: Int
    public let revenues: [RevenueAPIModel]

    public init(
        candidateCount: Int = 0,
        revenues: [RevenueAPIModel]
    ) {
        self.candidateCount = candidateCount
        self.revenues = revenues
    }

    public static let sample: StatisticsAPIModel = .init(
        candidateCount: 3,
        revenues: [RevenueAPIModel.sample]
    )
}
