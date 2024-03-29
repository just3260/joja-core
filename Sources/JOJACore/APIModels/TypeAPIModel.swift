
import Foundation

public struct TypeAPIModel: Codable, Hashable {
    
    /// 從哪裡知道 JOJA 的？
    public enum WhereToKnow: String, Codable, CaseIterable {
        case passBy // 路過
        case fb // Facebook
        case ig // Instagram
        case market // 市集
        case search // 網路搜尋
        case friend // 親友介紹
        case pinkoi // Pinkoi
        case eslite // 誠品
        case qsquare // 京站
        case jccac // JCCAC - 香港賽馬協會
        case goyound // 古漾
        case treasureHill // 寶藏巖國際藝術村
        case consignmentShop // 寄賣店
        
        public static func getKey() -> String {
            "where_to_know_type"
        }
        
        public func getName() -> String {
            switch self {
            case .passBy:
                return "路過"
            case .fb:
                return "Facebook"
            case .ig:
                return "Instagram"
            case .market:
                return "市集"
            case .search:
                return "網路搜尋"
            case .friend:
                return "親友介紹"
            case .pinkoi:
                return "Pinkoi"
            case .eslite:
                return "誠品"
            case .qsquare:
                return "京站"
            case .jccac:
                return "JCCAC - 香港賽馬協會"
            case .goyound:
                return "古漾"
            case .treasureHill:
                return "寶藏巖國際藝術村"
            case .consignmentShop:
                return "寄賣店"
            }
        }
    }
    
    /// 品牌
    public enum Brand: String, Codable, CaseIterable {
        case joja // JOJA
        case yuu // YUU
        case shishi // 實實
        case mount // 山牌
        case vingt_six // Vingt six
        case y_art // Y ART
        case childhood // CHILD
        case giants_tiedye // 巨人染
        case n_trail // N’trail
        case japan_socks // 日本襪
        case josie_personal // Josie私物
        
        public static func getKey() -> String {
            "brand_type"
        }
        
        public func getName() -> String {
            switch self {
            case .joja:
                return "JOJA"
            case .yuu:
                return "YUU"
            case .shishi:
                return "實實"
            case .mount:
                return "山牌"
            case .vingt_six:
                return "Vingt six"
            case .y_art:
                return "Y ART"
            case .childhood:
                return "CHILD"
            case .giants_tiedye:
                return "巨人染"
            case .n_trail:
                return "N’trail"
            case .japan_socks:
                return "日本襪"
            case .josie_personal:
                return "Josie私物"
            }
        }
    }
    
    /// 員工
    public enum Employee: String, Codable, CaseIterable {
        case josie // Josie
        case jn // 黃潔恩
        case yo_ya // 張由亞
        case yuu // 陳郁
        case yi_fan // 李宜凡
        case andrew // Andrew
        
        public static func getKey() -> String {
            "employee_type"
        }
        
        public func getName() -> String {
            switch self {
            case .josie:
                return "Josie"
            case .jn:
                return "黃潔恩"
            case .yo_ya:
                return "張由亞"
            case .yuu:
                return "陳郁"
            case .yi_fan:
                return "李宜凡"
            case .andrew:
                return "Andrew"
            }
        }
    }
    
    /// 品項
    public enum Goods: String, Codable, CaseIterable {
        case beret // 貝蕾
        case newsboy // 報童
        case bucket_hat // 漁夫
        case sun // 太陽
        case flower // 花形
        case lady // 淑女
        case flat_small // 小平頂
        case flat_big // 大平頂
        case scarf_short // 短領巾
        case scarf_long // 長領巾
        case square_small // 小方巾
        case square_big // 大方巾
        case headbands_narrow // 窄髮帶
        case headbands_wide // 寬髮帶
        case clip_earrings // 釦耳環
        case clip_ring // 釦戒指
        case ring // 素戒
        case pin // 別針
        case bucket_Bag // 水桶包
        case tote_bag // 托特包
        case bag_frame // 口金包
        case skirt // 裙
        case other // 其他
        
        public static func getKey() -> String {
            "goods_type"
        }
        
        public func getName() -> String {
            switch self {
            case .beret:
                return "貝蕾"
            case .newsboy:
                return "報童"
            case .bucket_hat:
                return "漁夫"
            case .sun:
                return "太陽"
            case .flower:
                return "花形"
            case .lady:
                return "淑女"
            case .flat_small:
                return "小平頂"
            case .flat_big:
                return "大平頂"
            case .scarf_short:
                return "短領巾"
            case .scarf_long:
                return "長領巾"
            case .square_small:
                return "小方巾"
            case .square_big:
                return "大方巾"
            case .headbands_narrow:
                return "窄髮帶"
            case .headbands_wide:
                return "寬髮帶"
            case .clip_earrings:
                return "釦耳環"
            case .clip_ring:
                return "釦戒指"
            case .ring:
                return "素戒"
            case .pin:
                return "別針"
            case .bucket_Bag:
                return "水桶包"
            case .tote_bag:
                return "托特包"
            case .bag_frame:
                return "口金包"
            case .skirt:
                return "裙"
            case .other:
                return "其他"
            }
        }
    }
    
    /// 寄賣品項
    public enum OtherGoods: String, Codable, CaseIterable {
        case clip_earrings // 夾式耳環
        case pin_earrings // 針式耳環
        case mask_chain // 口罩鍊
        case necklace // 項鍊
        case bracelet // 手鍊
        case pin // 別針
        case ring // 戒指
        case other // 其他
        
        public static func getKey() -> String {
            "other_goods_type"
        }
        
        public func getName() -> String {
            switch self {
            case .clip_earrings:
                return "夾式耳環"
            case .pin_earrings:
                return "針式耳環"
            case .mask_chain:
                return "口罩鍊"
            case .necklace:
                return "項鍊"
            case .bracelet:
                return "手鍊"
            case .pin:
                return "別針"
            case .ring:
                return "戒指"
            case .other:
                return "其他"
            }
        }
    }
    
    /// 材質
    public enum Material: String, Codable, CaseIterable {
        case cotton_wash // 素棉(水洗)
        case cotton_bubble // 素棉(泡泡)
        case calico_cotton // 印花(棉紗)
        case calico_new // 印花(新布)
        case calico_old // 印花(老布)
        case wool_old // 毛料-老花
        case wool // 毛料(一般)
        case flannel // 絨布(素色)
        case flannel_old // 絨布(老花)
        case suit // 西裝料
        case linen_old // 麻(老)
        case linen_new // 麻(新)
        case synthetic_fiber_old // 合成纖維(老)
        case synthetic_fiber_new // 合成纖維(新)
        case headbands_opaque // 領/髮(不透明)
        case headbands_translucent // 領/髮(半透明)
        case silk // 絲
        
        public static func getKey() -> String {
            "material_type"
        }
        
        public func getName() -> String {
            switch self {
            case .cotton_wash:
                return  "素棉(水洗)"
            case .cotton_bubble:
                return  "素棉(泡泡)"
            case .calico_cotton:
                return  "印花(棉紗)"
            case .calico_new:
                return  "印花(新布)"
            case .calico_old:
                return  "印花(老布)"
            case .wool_old:
                return  "毛料-老花"
            case .wool:
                return  "毛料(一般)"
            case .flannel:
                return  "絨布(素色)"
            case .flannel_old:
                return  "絨布(老花)"
            case .suit:
                return  "西裝料"
            case .linen_old:
                return  "麻(老)"
            case .linen_new:
                return  "麻(新)"
            case .synthetic_fiber_old:
                return  "合成纖維(老)"
            case .synthetic_fiber_new:
                return  "合成纖維(新)"
            case .headbands_opaque:
                return  "領/髮(不透明)"
            case .headbands_translucent:
                return  "領/髮(半透明)"
            case .silk:
                return  "絲"
            }
        }
    }
    
    /// 交易方式
    public enum Transaction: String, Codable, CaseIterable {
        case cash // 現金
        case remittance // 匯款
        case jkos_pay // 街口支付
        case credit_card // 實體信用卡
        case apply_pay // Apple pay
        case google_pay // Google pay
        case line_pay // Line PAY
        case insto // insto 國內
        case insto_foreign // insto 國外
        case ali_pay // 支付寶
        case payme // PayMe
        case wechat // 微信支付
        case stimulus_voucher // 振興券
        case coupons // 折價券
        
        public static func getKey() -> String {
            "transaction_type"
        }
        
        public func getName() -> String {
            switch self {
            case .cash:
                return "現金"
            case .remittance:
                return "匯款"
            case .jkos_pay:
                return "街口支付"
            case .credit_card:
                return "實體信用卡"
            case .apply_pay:
                return "Apple pay"
            case .google_pay:
                return "Google pay"
            case .line_pay:
                return "Line PAY"
            case .insto:
                return "insto 國內"
            case .insto_foreign:
                return "insto 國外"
            case .ali_pay:
                return "支付寶"
            case .payme:
                return "PayMe"
            case .wechat:
                return "微信支付"
            case .stimulus_voucher:
                return "振興券"
            case .coupons:
                return "折價券"
            }
        }
    }
    
    /// 顏色
    public enum Color: String, Codable, CaseIterable {
        case red // 紅色
        case orange // 橘色
        case yellow // 黃色
        case green // 綠色
        case blue // 藍色
        case purple // 紫色
        case pink // 粉&桃色
//        case peach // 桃色
        case brown // 大地色
        case black // 黑色
        case white // 白色
        case grey // 灰色
        case gold // 金色
        case silvery // 銀色
        case multi_color // 彩色
        
        public static func getKey() -> String {
            "color_type"
        }
        
        public func getName() -> String {
            switch self {
            case .red:
                return "紅"
            case .orange:
                return "橘"
            case .yellow:
                return "黃"
            case .green:
                return "綠"
            case .blue:
                return "藍"
            case .purple:
                return "紫"
            case .pink:
                return "粉/桃"
//            case .peach:
//                return "桃"
            case .brown:
                return "大地"
            case .black:
                return "黑"
            case .white:
                return "白"
            case .grey:
                return "灰"
            case .gold:
                return "金"
            case .silvery:
                return "銀"
            case .multi_color:
                return "彩色"
            }
        }
        
        public func getHexColor() -> String {
            switch self {
            case .red:
                return "#8d0901"
            case .orange:
                return "#c25a15"
            case .yellow:
                return "#ffd100"
            case .green:
                return "#578e24"
            case .blue:
                return "#25449d"
            case .purple:
                return "#6547AA"
            case .pink:
                return "#f681b5"
//            case .peach:
//                return "#bb4780"
            case .brown:
                return "#7E4E20"
            case .black:
                return "#000000"
            case .white:
                return "#FEFEFE"
            case .grey:
                return "#706f6f"
            case .gold:
                return "#ca9f2d"
            case .silvery:
                return "#c3c3c3"
            case .multi_color:
                return "#000000"
            }
        }
    }
    
    /// 花色
    public enum Design: String, Codable, CaseIterable {
        case plain // 素色
        case gradation // 漸層
        case block // 色塊
        case geometry // 幾何
        case stripe // 條紋
        case dot // 點點
        case plaid // 格紋
        case paisley // 變形蟲
        case totem // 圖騰
        case graffiti // 塗鴉
        case painting // 油畫
        case watercolor // 水彩
        case plant // 植物
        case animal // 動物
        case festival // 節慶限定

        public static func getKey() -> String {
            "design_type"
        }
        
        public func getName() -> String {
            switch self {
            case .plain:
                return "素色"
            case .gradation:
                return "漸層"
            case .block:
                return "色塊"
            case .geometry:
                return "幾何"
            case .stripe:
                return "條紋"
            case .dot:
                return "點點"
            case .plaid:
                return "格紋"
            case .paisley:
                return "變形蟲"
            case .totem:
                return "圖騰"
            case .graffiti:
                return "塗鴉"
            case .painting:
                return "油畫"
            case .watercolor:
                return "水彩"
            case .plant:
                return "植物"
            case .animal:
                return "動物"
            case .festival:
                return "節慶限定"
            }
        }
    }
    
    /// 搜尋類型
    public enum SearchType: String, Codable, CaseIterable {
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
            "search_type"
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
}
