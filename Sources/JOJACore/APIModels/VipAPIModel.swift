import Foundation

// MARK: - VIP Rule Constants

public struct VipRuleConstants {
    /// 累積消費達到此金額成為 VIP
    public static let vipThreshold: Int = 10000

    /// 單筆消費達到此金額立即成為 VIP
    public static let singleTransactionVipThreshold: Int = 8000

    /// VIP 折扣率 (10% off)
    public static let vipDiscountRate: Double = 0.1
}

// MARK: - VIP Reason

public enum VipReason: Codable, Hashable, Sendable {
    case singleTransaction(amount: Int)
    case cumulativeAmount(previousAmount: Int, newAmount: Int)
    case alreadyVip

    public var description: String {
        switch self {
        case .singleTransaction(let amount):
            return "單筆消費 \(amount) 達到門檻"
        case .cumulativeAmount(let previous, let new):
            return "累積消費從 \(previous) 增加到 \(new)"
        case .alreadyVip:
            return "已是 VIP 會員"
        }
    }
}

// MARK: - VIP Calculation Result

public struct VipCalculationResult: Codable, Hashable, Sendable {
    /// 是否會成為 VIP
    public let willBecomeVip: Bool

    /// 成為 VIP 的原因
    public let becomeVipReason: VipReason?

    /// 實際累積金額 (扣除 JOJA 折扣後)
    public let effectiveAmount: Int

    /// JOJA 商品折扣金額
    public let jojaDiscount: Int

    public init(
        willBecomeVip: Bool,
        becomeVipReason: VipReason?,
        effectiveAmount: Int,
        jojaDiscount: Int
    ) {
        self.willBecomeVip = willBecomeVip
        self.becomeVipReason = becomeVipReason
        self.effectiveAmount = effectiveAmount
        self.jojaDiscount = jojaDiscount
    }
}

// MARK: - VIP Calculator

public struct VipCalculator {

    public static func calculateVipStatus(
        currentAmount: Int,
        isCurrentlyVip: Bool,
        additionalAmount: Int,
        jojaAmount: Int
    ) -> VipCalculationResult {
        let wasVip = isCurrentlyVip
        let previousAmount = currentAmount

        // Rule 1: 單筆消費達到門檻 (>= 8000) 立即成為 VIP
        if !wasVip && additionalAmount >= VipRuleConstants.singleTransactionVipThreshold && currentAmount == 0 {
            let amountOverThreshold = additionalAmount - VipRuleConstants.singleTransactionVipThreshold
            let (effectiveAmount, jojaDiscount) = calculateDiscountedAmount(
                totalAmount: additionalAmount,
                jojaAmount: jojaAmount,
                amountOverThreshold: amountOverThreshold
            )

            return VipCalculationResult(
                willBecomeVip: true,
                becomeVipReason: .singleTransaction(amount: additionalAmount),
                effectiveAmount: effectiveAmount,
                jojaDiscount: jojaDiscount
            )
        }

        // Rule 2: 已經是 VIP,保持身份,JOJA 商品直接打九折
        if wasVip {
            let jojaDiscount = calculateFullJojaDiscount(jojaAmount: jojaAmount)
            let effectiveAmount = additionalAmount - jojaDiscount

            return VipCalculationResult(
                willBecomeVip: true,
                becomeVipReason: .alreadyVip,
                effectiveAmount: effectiveAmount,
                jojaDiscount: jojaDiscount
            )
        }

        // Rule 3: 檢查累積金額是否跨越 VIP 門檻 (>= 10000)
        let potentialTotal = previousAmount + additionalAmount

        if previousAmount < VipRuleConstants.vipThreshold && potentialTotal >= VipRuleConstants.vipThreshold {
            let amountToThreshold = VipRuleConstants.vipThreshold - previousAmount
            let amountOverThreshold = additionalAmount - amountToThreshold

            let (effectiveAmount, jojaDiscount) = calculateDiscountedAmount(
                totalAmount: additionalAmount,
                jojaAmount: jojaAmount,
                amountOverThreshold: amountOverThreshold
            )

            return VipCalculationResult(
                willBecomeVip: true,
                becomeVipReason: .cumulativeAmount(
                    previousAmount: previousAmount,
                    newAmount: potentialTotal - jojaDiscount
                ),
                effectiveAmount: effectiveAmount,
                jojaDiscount: jojaDiscount
            )
        }

        // 尚未達到 VIP 門檻
        return VipCalculationResult(
            willBecomeVip: false,
            becomeVipReason: nil,
            effectiveAmount: additionalAmount,
            jojaDiscount: 0
        )
    }

    private static func calculateDiscountedAmount(
        totalAmount: Int,
        jojaAmount: Int,
        amountOverThreshold: Int
    ) -> (effectiveAmount: Int, jojaDiscount: Int) {
        guard jojaAmount > 0, amountOverThreshold > 0 else {
            return (totalAmount, 0)
        }

        let discountableAmount = min(jojaAmount, amountOverThreshold)
        let jojaDiscount = Int(Double(discountableAmount) * VipRuleConstants.vipDiscountRate)
        let effectiveAmount = totalAmount - jojaDiscount

        return (effectiveAmount, jojaDiscount)
    }

    private static func calculateFullJojaDiscount(jojaAmount: Int) -> Int {
        guard jojaAmount > 0 else { return 0 }
        return Int(Double(jojaAmount) * VipRuleConstants.vipDiscountRate)
    }
}

// MARK: - VIP API Model

public struct VipAPIModel: Codable, Hashable, Sendable {

    public struct Request: Codable, Hashable, Sendable {
        /// 會員目前累積金額
        public let currentAmount: Int

        /// 會員目前是否為 VIP
        public let isCurrentlyVip: Bool

        /// 本次消費金額
        public let additionalAmount: Int

        /// 其中 JOJA 商品金額
        public let jojaAmount: Int

        public init(
            currentAmount: Int,
            isCurrentlyVip: Bool,
            additionalAmount: Int,
            jojaAmount: Int
        ) {
            self.currentAmount = currentAmount
            self.isCurrentlyVip = isCurrentlyVip
            self.additionalAmount = additionalAmount
            self.jojaAmount = jojaAmount
        }

        public static let sample: VipAPIModel.Request = .init(
            currentAmount: 7000,
            isCurrentlyVip: false,
            additionalAmount: 6000,
            jojaAmount: 4000
        )
    }

    public struct Response: Codable, Hashable, Sendable {
        /// 是否會成為 VIP
        public let willBecomeVip: Bool

        /// 成為 VIP 的原因描述
        public let reason: String?

        /// 實際累積金額（扣除折扣後）
        public let effectiveAmount: Int

        /// JOJA 折扣金額
        public let jojaDiscount: Int

        /// 新的累積總額
        public let newTotalAmount: Int

        /// 最終應付金額
        public let finalPayableAmount: Int

        public init(
            willBecomeVip: Bool,
            reason: String?,
            effectiveAmount: Int,
            jojaDiscount: Int,
            newTotalAmount: Int,
            finalPayableAmount: Int
        ) {
            self.willBecomeVip = willBecomeVip
            self.reason = reason
            self.effectiveAmount = effectiveAmount
            self.jojaDiscount = jojaDiscount
            self.newTotalAmount = newTotalAmount
            self.finalPayableAmount = finalPayableAmount
        }

        public static let sample: VipAPIModel.Response = .init(
            willBecomeVip: true,
            reason: "累積消費從 $8,000 增加到 $11,800",
            effectiveAmount: 3800,
            jojaDiscount: 200,
            newTotalAmount: 11800,
            finalPayableAmount: 3800
        )
    }
}
