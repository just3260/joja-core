//
//  File.swift
//  
//
//  Created by Andrew on 2024/1/10.
//

import Foundation

public protocol Searchable: Codable, Hashable {}

public struct SearchType: Codable, Hashable {
    /// 搜尋類型
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
    
    /// 搜尋類型
    public enum Fabric: String, Searchable, CaseIterable {
        case name // 名稱
        case material // 材質
        case cottonMaterial // 棉布材質
        case age // 布料年代
        case design // 花色
        case color // 顏色
        case sn // 布料編號
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
            case .sn:
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

public struct SearchAPIModel<T>: Codable, Hashable where T: Searchable {
    public let key: String
    public let type: [T]
    public let matchAll: Bool
    
    public init(key: String, type: [T] = [], matchAll: Bool = false) {
        self.key = key
        self.type = type
        self.matchAll = matchAll
    }
}
