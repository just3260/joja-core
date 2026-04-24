//
//  File.swift
//  
//
//  Created by Andrew on 2024/1/10.
//

import Foundation

public protocol Searchable: Codable, Hashable, Sendable {}

public struct SearchType: Codable, Hashable, Sendable {
    /// Member 搜尋類型
    public enum Member: String, Searchable, CaseIterable {
        case name // 姓名
        case phone // 電話
        case birthday // 生日
        case from // 從哪裡知道
        case address // 地址
        case email // email
        case note // 備註
        case amount // 消費金額
        case isVip // 是否為vip
        case createdAt // 建立日期
        case updatedAt // 最後更新日期
        
        public static func getKey() -> String {
            "member_search_type"
        }
        
        public func getName() -> String {
            switch self {
            case .name:
                return "姓名"
            case .phone:
                return "電話"
            case .birthday:
                return "生日"
            case .from:
                return "從哪裡知道"
            case .address:
                return "地址"
            case .email:
                return "email"
            case .note:
                return "備註"
            case .amount:
                return "消費金額"
            case .isVip:
                return "是否為vip"
            case .createdAt:
                return "建立日期"
            case .updatedAt:
                return "最後更新日期"
            }
        }
    }
    
    public struct ComponentFilters: Codable, Hashable, Sendable {
        public let materials: [TypeAPIModel.Material]?
        public let cottonMaterials: [TypeAPIModel.CottonMaterial]?
        public let ages: [TypeAPIModel.Age]?
        public let designs: [TypeAPIModel.Design]?
        public let colors: [TypeAPIModel.Color]?

        public init(
            materials: [TypeAPIModel.Material]? = nil,
            cottonMaterials: [TypeAPIModel.CottonMaterial]? = nil,
            ages: [TypeAPIModel.Age]? = nil,
            designs: [TypeAPIModel.Design]? = nil,
            colors: [TypeAPIModel.Color]? = nil
        ) {
            self.materials = materials
            self.cottonMaterials = cottonMaterials
            self.ages = ages
            self.designs = designs
            self.colors = colors
        }
    }
    
    /// Fabric 搜尋類型
    public enum Fabric: String, Searchable, CaseIterable {
        case name // 名稱
        case material // 材質
        case cottonMaterial // 棉布材質
        case age // 布料年代
        case design // 花色
        case color // 顏色
        case sku // 布料編號
        case storage // 存放位置
        case tag // tag
        case note // 備註
        case createdAt // 建立日期
        case updatedAt // 最後更新日期
        
        public static func getKey() -> String {
            "fabric_search_type"
        }
        
        public func getName() -> String {
            switch self {
            case .name:
                return "名稱"
            case .material:
                return "材質"
            case .cottonMaterial:
                return "棉布材質"
            case .age:
                return "布料年代"
            case .design:
                return "花色"
            case .color:
                return "顏色"
            case .sku:
                return "布料編號"
            case .storage:
                return "存放位置"
            case .tag:
                return "tag"
            case .note:
                return "備註"
            case .createdAt:
                return "建立日期"
            case .updatedAt:
                return "最後更新日期"
            }
        }
    }
    
    /// Product 搜尋類型
    public enum Product: String, Searchable, CaseIterable {
        case name // 名稱
        case brand // 品牌
        case type // 商品類型
        case jojaFabric // JOJA 布料商品
        case jojaOther // JOJA 其他商品
        case otherGoods // 其他品牌商品
        case size // 尺寸
        case material // 材質
        case cottonMaterial // 棉布材質
        case age // 布料年代
        case design // 花色
        case color // 顏色
        case sku // 商品編號
        case storage // 存放位置
        case tag // tag
        case note // 備註
        case createdAt // 建立日期
        case updatedAt // 最後更新日期
        
        public static func getKey() -> String {
            "product_search_type"
        }
        
        public func getName() -> String {
            switch self {
                case .name:
                    return "名稱"
                case .brand:
                    return "品牌"
                case .type:
                    return "商品類型"
                case .jojaFabric:
                    return "JOJA 布料商品"
                case .jojaOther:
                    return "JOJA 其他商品"
                case .otherGoods:
                    return "其他品牌商品"
                case .size:
                    return "尺寸"
                case .material:
                    return "材質"
                case .cottonMaterial:
                    return "棉布材質"
                case .age:
                    return "布料年代"
                case .design:
                    return "花色"
                case .color:
                    return "顏色"
                case .sku:
                    return "布料編號"
                case .storage:
                    return "存放位置"
                case .tag:
                    return "tag"
                case .note:
                    return "備註"
                case .createdAt:
                    return "建立日期"
                case .updatedAt:
                    return "最後更新日期"
            }
        }
    }
}

public struct FabricSearchRequest: Searchable {
    public enum KeywordField: String, Codable, Hashable, CaseIterable {
        case name
        case sku
        case description
        case note

        public var displayName: String {
            switch self {
                case .name: return "名稱"
                case .sku: return "布料編號"
                case .description: return "描述"
                case .note: return "備註"
            }
        }
    }
    /// 關鍵字搜尋欄位，支援多選
    public let keywordFields: [KeywordField]?
    /// 材質/年份/顏色/花色...進階條件
    public let componentFilters: SearchType.ComponentFilters?
    /// 多倉庫位置篩選
    public let storageLocations: [TypeAPIModel.Location]?
    /// 標籤多選
    public let tags: [String]?
    /// 建立日期範圍
    public let createdAtRange: ClosedRange<Date>?
    /// 更新日期範圍
    public let updatedAtRange: ClosedRange<Date>?
    /// 價格區間
    public let priceRange: ClosedRange<Int>?
    /// 庫存區間
    public let stockRange: ClosedRange<Double>?

    public init(
        keywordFields: [KeywordField]? = nil,
        componentFilters: SearchType.ComponentFilters? = nil,
        storageLocations: [TypeAPIModel.Location]? = nil,
        tags: [String]? = nil,
        createdAtRange: ClosedRange<Date>? = nil,
        updatedAtRange: ClosedRange<Date>? = nil,
        priceRange: ClosedRange<Int>? = nil,
        stockRange: ClosedRange<Double>? = nil
    ) {
        self.keywordFields = keywordFields
        self.componentFilters = componentFilters
        self.storageLocations = storageLocations
        self.tags = tags
        self.createdAtRange = createdAtRange
        self.updatedAtRange = updatedAtRange
        self.priceRange = priceRange
        self.stockRange = stockRange
    }
}

public struct TradeSearchRequest: Searchable {
    public enum KeywordField: String, Codable, Hashable, CaseIterable {
        case description
        case note
        case log

        public var displayName: String {
            switch self {
                case .description: return "描述"
                case .note: return "備註"
                case .log: return "交易紀錄"
            }
        }
    }
    /// 關鍵字搜尋欄位，支援多選
    public let keywordFields: [KeywordField]?
    /// 買家ID篩選
    public let buyerIds: [UUID]?
    /// 銷售人員ID篩選
    public let sellerIds: [UUID]?
    /// 金額範圍
    public let amountRange: ClosedRange<Int>?
    /// 消費地點篩選
    public let spendingLocations: [TypeAPIModel.SpendingLocation]?
    /// 付款方式
    public let transactionType: [TypeAPIModel.Transaction]?
    /// 建立日期範圍
    public let createdAtRange: ClosedRange<Date>?
    /// 更新日期範圍
    public let updatedAtRange: ClosedRange<Date>?

    public init(
        keywordFields: [KeywordField]? = nil,
        buyerIds: [UUID]? = nil,
        sellerIds: [UUID]? = nil,
        amountRange: ClosedRange<Int>? = nil,
        spendingLocations: [TypeAPIModel.SpendingLocation]? = nil,
        transactionType: [TypeAPIModel.Transaction]? = nil,
        createdAtRange: ClosedRange<Date>? = nil,
        updatedAtRange: ClosedRange<Date>? = nil,
    ) {
        self.keywordFields = keywordFields
        self.buyerIds = buyerIds
        self.sellerIds = sellerIds
        self.amountRange = amountRange
        self.spendingLocations = spendingLocations
        self.transactionType = transactionType
        self.createdAtRange = createdAtRange
        self.updatedAtRange = updatedAtRange
    }
}

public struct ProductTemplateSearchRequest: Searchable {
    public enum KeywordField: String, Codable, Hashable, CaseIterable, Sendable {
        case name
        case sku
        case description
        case originalSku

        public var displayName: String {
            switch self {
                case .name: return "名稱"
                case .sku: return "商品編號"
                case .description: return "描述"
                case .originalSku: return "原始商品編號"
            }
        }
    }
    /// 關鍵字搜尋欄位，支援多選
    public let keywordFields: [KeywordField]?
    /// 品牌篩選
    public let brands: [TypeAPIModel.Brand]?
    /// 商品類型篩選
    public let productTypes: [TypeAPIModel.ProductType]?
    /// JOJA 布料商品子類型篩選
    public let jojaFabricGoods: [TypeAPIModel.JojaFabricGoods]?
    /// JOJA 其他商品子類型篩選
    public let jojaOtherGoods: [TypeAPIModel.JojaOtherGoods]?
    /// 其他品牌商品子類型篩選
    public let otherBrandGoods: [TypeAPIModel.OtherBrandGoods]?
    /// 尺寸篩選
    public let sizes: [TypeAPIModel.Size]?
    /// 材質/年份/顏色/花色...進階條件
    public let componentFilters: SearchType.ComponentFilters?
    /// 價格區間
    public let priceRange: ClosedRange<Int>?
    /// 庫存數量區間
    public let inventoryCountRange: ClosedRange<Int>?
    /// 建立日期範圍
    public let createdAtRange: ClosedRange<Date>?
    /// 更新日期範圍
    public let updatedAtRange: ClosedRange<Date>?
    /// 啟用狀態篩選
    public let isPublished: Bool?
    /// 是否有關聯布料篩選
    public let hasFabric: Bool?
    /// 庫存所在位置篩選（符合任一位置即納入）
    public let locationTypes: [TypeAPIModel.Location]?

    public init(
        keywordFields: [KeywordField]? = nil,
        brands: [TypeAPIModel.Brand]? = nil,
        productTypes: [TypeAPIModel.ProductType]? = nil,
        jojaFabricGoods: [TypeAPIModel.JojaFabricGoods]? = nil,
        jojaOtherGoods: [TypeAPIModel.JojaOtherGoods]? = nil,
        otherBrandGoods: [TypeAPIModel.OtherBrandGoods]? = nil,
        sizes: [TypeAPIModel.Size]? = nil,
        componentFilters: SearchType.ComponentFilters? = nil,
        priceRange: ClosedRange<Int>? = nil,
        inventoryCountRange: ClosedRange<Int>? = nil,
        createdAtRange: ClosedRange<Date>? = nil,
        updatedAtRange: ClosedRange<Date>? = nil,
        isPublished: Bool? = nil,
        hasFabric: Bool? = nil,
        locationTypes: [TypeAPIModel.Location]? = nil
    ) {
        self.keywordFields = keywordFields
        self.brands = brands
        self.productTypes = productTypes
        self.jojaFabricGoods = jojaFabricGoods
        self.jojaOtherGoods = jojaOtherGoods
        self.otherBrandGoods = otherBrandGoods
        self.sizes = sizes
        self.componentFilters = componentFilters
        self.priceRange = priceRange
        self.inventoryCountRange = inventoryCountRange
        self.createdAtRange = createdAtRange
        self.updatedAtRange = updatedAtRange
        self.isPublished = isPublished
        self.hasFabric = hasFabric
        self.locationTypes = locationTypes
    }
}

public struct ProductInventorySearchRequest: Searchable {
    public enum KeywordField: String, Codable, Hashable, CaseIterable, Sendable {
        case serialNumber
        case templateSku
        case condition
        case note

        public var displayName: String {
            switch self {
                case .serialNumber: return "序號"
                case .templateSku: return "商品編號"
                case .condition: return "狀況"
                case .note: return "備註"
            }
        }
    }

    /// 關鍵字搜尋欄位，支援多選
    public let keywordFields: [KeywordField]?
    /// 商品模板 ID 篩選
    public let templateID: UUID?
    /// 庫存狀態篩選
    public let statuses: [TypeAPIModel.InventoryStatus]?
    /// 存放位置篩選
    public let locations: [TypeAPIModel.Location]?
    /// 實際售價區間
    public let actualPriceRange: ClosedRange<Int>?
    /// 建立日期範圍
    public let createdAtRange: ClosedRange<Date>?
    /// 更新日期範圍
    public let updatedAtRange: ClosedRange<Date>?

    public init(
        keywordFields: [KeywordField]? = nil,
        templateID: UUID? = nil,
        statuses: [TypeAPIModel.InventoryStatus]? = nil,
        locations: [TypeAPIModel.Location]? = nil,
        actualPriceRange: ClosedRange<Int>? = nil,
        createdAtRange: ClosedRange<Date>? = nil,
        updatedAtRange: ClosedRange<Date>? = nil
    ) {
        self.keywordFields = keywordFields
        self.templateID = templateID
        self.statuses = statuses
        self.locations = locations
        self.actualPriceRange = actualPriceRange
        self.createdAtRange = createdAtRange
        self.updatedAtRange = updatedAtRange
    }
}

public struct SearchAPIModel<T>: Codable, Hashable, Sendable where T: Searchable {
    public let key: String
    public let type: [T]
    public let matchAll: Bool
    
    public init(key: String, type: [T] = [], matchAll: Bool = false) {
        self.key = key
        self.type = type
        self.matchAll = matchAll
    }
}
