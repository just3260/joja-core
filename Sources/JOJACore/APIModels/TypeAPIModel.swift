import Foundation

public protocol TypeCommon: Codable, CaseIterable, Hashable, Sendable {
    static func getKey() -> String
    func getName() -> String
    static func find(from name: String) -> Self?
}

public struct TypeAPIModel: Codable, Hashable, Sendable {
    
    /// 從哪裡知道 JOJA 的？
    public enum WhereToKnow: String, TypeCommon {
        case taipei // JOJA台北赤峰
        case tainan // JOJA台南店
        case fb // Facebook
        case ig // Instagram
        case market // 市集
        case search // 網路搜尋
        case friend // 親友介紹
        case pinkoi // Pinkoi
        case eslite // 誠品
        case qsquare // 京站
        case jccac // JCCAC - 香港賽馬協會
        case goyoung // 古漾
        case treasureHill // 寶藏巖國際藝術村
        case consignmentShop // 寄賣店
        
        public static func getKey() -> String {
            "where_to_know_type"
        }
        
        public func getName() -> String {
            switch self {
            case .taipei:
                return "JOJA台北赤峰"
            case .tainan:
                return "JOJA台南店"
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
            case .goyoung:
                return "古漾"
            case .treasureHill:
                return "寶藏巖國際藝術村"
            case .consignmentShop:
                return "寄賣店"
            }
        }
        
        public static func find(from name: String) -> WhereToKnow? {
            return WhereToKnow.allCases.first { type in
                type.getName() == name
            }
        }
    }
    
    /// 品牌
    public enum Brand: String, TypeCommon {
        case joja
        case yuu
        case feat_yuu
        case how_fan
        case feat_howfan
        case feat_y_art
        case feat_childhood
        case japan_socks
        case josie_personal
        case marco
        case vingt_six
        case design_3_14
        case yuguand
        case febbi
        case in_allyes
        case yr_wonder_land
        case n_trail
        case paper
        case st_light
        case shishi
        case mount
        case giants_tiedye
        
        public static func getKey() -> String {
            "brand_type"
        }
        
        public static func getBrand(from name: String) -> Brand? {
            switch name {
                case "JOJA":
                    return .joja
                case "YUU YUU LAB":
                    return .yuu
                case "JOJA x YUU":
                    return .feat_yuu
                case "好煩小姐":
                    return .how_fan
                case "JOJA好煩":
                    return .feat_howfan
                case "JOJA x Y ART":
                    return .feat_y_art
                case "JOJA x CHILDHOOD":
                    return .feat_childhood
                case "日本襪":
                    return .japan_socks
                case "Josie私物":
                    return .josie_personal
                case "MARCO":
                    return .marco
                case "Vingt Six":
                    return .vingt_six
                case "3.14":
                    return .design_3_14
                case "隅光":
                    return .yuguand
                case "Febbi":
                    return .febbi
                case "巷弄":
                    return .in_allyes
                case "海獸花園":
                    return .yr_wonder_land
                case "N'trail":
                    return .n_trail
                case "紙造可能":
                    return .paper
                case "陌光":
                    return .st_light
                case "實實":
                    return .shishi
                case "山牌":
                    return .mount
                case "巨人染":
                    return .giants_tiedye
                default:
                    return nil
            }
        }
        
        public func getName() -> String {
            switch self {
            case .joja:
                return "JOJA"
            case .yuu:
                return "YUU YUU LAB"
            case .feat_yuu:
                return "JOJA x YUU"
            case .how_fan:
                return "好煩小姐"
            case .feat_howfan:
                return "JOJA好煩"
            case .feat_y_art:
                return "JOJA x Y ART"
            case .feat_childhood:
                return "JOJA x CHILDHOOD"
            case .japan_socks:
                return "日本襪"
            case .josie_personal:
                return "Josie私物"
            case .marco:
                return "MARCO"
            case .vingt_six:
                return "Vingt Six"
            case .design_3_14:
                return "3.14"
            case .yuguand:
                return "隅光"
            case .febbi:
                return "Febbi"
            case .in_allyes:
                return "巷弄"
            case .yr_wonder_land:
                return "海獸花園"
            case .n_trail:
                return "N'trail"
            case .paper:
                return "紙造可能"
            case .st_light:
                return "陌光"
            case .shishi:
                return "實實"
            case .mount:
                return "山牌"
            case .giants_tiedye:
                return "巨人染"
            }
        }
        
        public static func find(from name: String) -> Brand? {
            return Brand.allCases.first { type in
                type.getName() == name
            }
        }
    }
    
    /// 員工
    public enum Employee: String, TypeCommon {
        case josie // Josie
        case jn // 黃潔恩
        case yuu // 陳郁
        case yi_fan // 李宜凡
        case mini // Mini
        case jiajie // 家婕
        case tian // 內田
        case du // 小杜
        case xing // 阿心
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
            case .yuu:
                return "陳郁"
            case .yi_fan:
                return "李宜凡"
            case .mini:
                return "Mini"
            case .jiajie:
                return "家婕"
            case .tian:
                return "內田"
            case .du:
                return "小杜"
            case .xing:
                return "阿心"
            case .andrew:
                return "Andrew"
            }
        }
        
        public static func find(from name: String) -> Employee? {
            return Employee.allCases.first { type in
                type.getName() == name
            }
        }
    }
    
    /// 交易方式
    public enum Transaction: String, TypeCommon {
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
        
        public static func find(from name: String) -> Transaction? {
            return Transaction.allCases.first { type in
                type.getName() == name
            }
        }
    }
    
    /// 商品類型
    public enum ProductType: String, TypeCommon {
        case jojaFabric // JOJA 布料商品
        case jojaOther // JOJA 其他商品
        case otherBrand // 寄賣商品

        public static func getKey() -> String {
            "product_type"
        }

        public func getName() -> String {
            switch self {
                case .jojaFabric:
                    return "JOJA 布料商品"
                case .jojaOther:
                    return "JOJA 其他商品"
                case .otherBrand:
                    return "寄賣商品"
            }
        }

        /// 取得商品子類型的名稱列表（更安全的實作）
        public func getSubTypeNames() -> [String] {
            switch self {
                case .jojaFabric:
                    return JojaFabricGoods.allCases.map { $0.getName() }
                case .jojaOther:
                    return JojaOtherGoods.allCases.map { $0.getName() }
                case .otherBrand:
                    return OtherBrandGoods.allCases.map { $0.getName() }
            }
        }

        /// 根據名稱找到對應的子類型
        public func findSubType(from name: String) -> (any TypeCommon)? {
            switch self {
                case .jojaFabric:
                    return JojaFabricGoods.find(from: name)
                case .jojaOther:
                    return JojaOtherGoods.find(from: name)
                case .otherBrand:
                    return OtherBrandGoods.find(from: name)
            }
        }

        public static func find(from name: String) -> ProductType? {
            return ProductType.allCases.first { type in
                type.getName() == name
            }
        }
    }

    /// JOJA 布料商品品項
    public enum JojaFabricGoods: String, TypeCommon {
        case beret // 貝蕾
        case newsboy // 報童
        case bucket_hat // 漁夫
        case sun // 太陽
        case flower // 花形
        case lady // 淑女
        case flat // 小平頂
        case bigFlat // 大平頂
        case scarf // 領巾
        case square // 方巾
        case headbands // 髮帶
        case bucket_Bag // 水桶包
        case tote_bag // 托特包
        case skirt // 裙

        public static func getKey() -> String {
            "joja_fabric_goods_type"
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
                case .flat:
                    return "小平頂"
                case .bigFlat:
                    return "大平頂"
                case .scarf:
                    return "領巾"
                case .square:
                    return "方巾"
                case .headbands:
                    return "髮帶"
                case .bucket_Bag:
                    return "水桶包"
                case .tote_bag:
                    return "托特包"
                case .skirt:
                    return "裙"
            }
        }
        
        public func getSerial() -> String {
            switch self {
                case .beret:
                    return "B" // 貝蕾
                case .newsboy:
                    return "N" // 報童
                case .bucket_hat:
                    return "F" // 漁夫
                case .sun:
                    return "S" // 太陽
                case .flower:
                    return "T" // 花形
                case .lady:
                    return "L" // 淑女
                case .flat:
                    return "W" // 小平頂
                case .bigFlat:
                    return "V" // 大平頂
//                case .scarf:
//                    return "" // 領巾
//                case .square:
//                    return "" // 方巾
//                case .headbands:
//                    return "" // 髮帶
//                case .bucket_Bag:
//                    return "" // 水桶包
//                case .tote_bag:
//                    return "" // 托特包
//                case .skirt:
//                    return "" // 裙
                default:
                    return "N/A"
            }
        }

        public static func find(from name: String) -> JojaFabricGoods? {
            return JojaFabricGoods.allCases.first { type in
                type.getName() == name
            }
        }
    }

    /// JOJA 其他商品品項
    public enum JojaOtherGoods: String, TypeCommon {
        case clip_earrings // 釦耳環
        case clip_ring // 釦戒指
        case ring // 素戒
        case pin // 別針
        case bag_frame // 口金包
        case other // 其他

        public static func getKey() -> String {
            "joja_other_goods_type"
        }

        public func getName() -> String {
            switch self {
                case .clip_earrings:
                    return "釦耳環"
                case .clip_ring:
                    return "釦戒指"
                case .ring:
                    return "素戒"
                case .pin:
                    return "別針"
                case .bag_frame:
                    return "口金包"
                case .other:
                    return "其他"
            }
        }

        public static func find(from name: String) -> JojaOtherGoods? {
            return JojaOtherGoods.allCases.first { type in
                type.getName() == name
            }
        }
    }

    /// 合作品牌商品品項
    public enum OtherBrandGoods: String, TypeCommon {
        case clip_earrings // 夾式耳環
        case pin_earrings // 針式耳環
        case mask_chain // 口罩鍊
        case necklace // 項鍊
        case bracelet // 手鍊
        case pin // 別針
        case ring // 戒指
        case other // 其他

        public static func getKey() -> String {
            "other_brand_goods_type"
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

        public static func find(from name: String) -> OtherBrandGoods? {
            return OtherBrandGoods.allCases.first { type in
                type.getName() == name
            }
        }
    }

    /// 材質
    public enum Material: String, TypeCommon {
        case cotton // 棉布
        case linen // 麻
        case denim // 牛仔布
        case suit // 西裝料
        case velvet // 絨布
        case wool // 毛料
        case synthetic_fiber // 合成纖維
        case chiffon // 雪紡紗
        case silk // 絲

        public static func getKey() -> String {
            "material_type"
        }

        public func getName() -> String {
            switch self {
            case .cotton:
                return "棉布"
            case .linen:
                return "麻"
            case .denim:
                return "牛仔布"
            case .suit:
                return "西裝料"
            case .velvet:
                return "絨布"
            case .wool:
                return "毛料"
            case .synthetic_fiber:
                return "合成纖維"
            case .chiffon:
                return "雪紡紗"
            case .silk:
                return "絲"
            }
        }

        public func getSerial() -> String {
            switch self {
            case .cotton:
                return "1" // 棉布
            case .linen:
                return "2" // 麻
            case .denim:
                return "3" // 牛仔布
            case .suit:
                return "4" // 西裝料
            case .velvet:
                return "5" // 絨布
            case .wool:
                return "6" // 毛料
            case .synthetic_fiber:
                return "7" // 合成纖維
            case .chiffon:
                return "8" // 雪紡紗
            case .silk:
                return "9" // 絲
            }
        }

        public static func find(from name: String) -> Material? {
            return Material.allCases.first { type in
                type.getName() == name
            }
        }
    }

    /// 棉布材質
    public enum CottonMaterial: String, TypeCommon {
        case thin_bubble // 薄泡泡綿紗
        case thick_bubble // 厚泡泡綿紗
        case wash // 中水洗棉
        case wrinkle_wash // 皺皺水洗棉
        case grey // 胚布原色雜點水洗棉
        case japan_plain // 日本素色棉紗
        case japan_print // 印花棉紗
        case calico // 印花棉布
        case thin_canvas // 薄酒袋布
        case thick_canvas // 厚酒袋布

        public static func getKey() -> String {
            "cotton_material_type"
        }

        public func getName() -> String {
            switch self {
            case .thin_bubble:
                return "薄泡泡綿紗"
            case .thick_bubble:
                return "厚泡泡綿紗"
            case .wash:
                return "中水洗棉"
            case .wrinkle_wash:
                return "皺皺水洗棉"
            case .grey:
                return "胚布原色雜點水洗棉"
            case .japan_plain:
                return "日本素色棉紗"
            case .japan_print:
                return "印花棉紗"
            case .calico:
                return "印花棉布"
            case .thin_canvas:
                return "薄酒袋布"
            case .thick_canvas:
                return "厚酒袋布"
            }
        }

        public func getSerial() -> String {
            switch self {
            case .thin_bubble:
                return "1" // 薄泡泡綿紗
            case .thick_bubble:
                return "2" // 厚泡泡綿紗
            case .wash:
                return "3" // 中水洗棉
            case .wrinkle_wash:
                return "4" // 皺皺水洗棉
            case .grey:
                return "5" // 胚布原色雜點水洗棉
            case .japan_plain:
                return "6" // 日本素色棉紗
            case .japan_print:
                return "7" // 印花棉紗
            case .calico:
                return "8" // 印花棉布
            case .thin_canvas:
                return "9" // 薄酒袋布
            case .thick_canvas:
                return "A" // 厚酒袋布
            }
        }

        public static func find(from name: String) -> CottonMaterial? {
            return CottonMaterial.allCases.first { type in
                type.getName() == name
            }
        }
    }

    /// 布料年代
    public enum Age: String, TypeCommon {
        case new // 新布
        case old // 老布

        public static func getKey() -> String {
            "age_type"
        }

        public func getName() -> String {
            switch self {
            case .new:
                return "新布"
            case .old:
                return "老布"
            }
        }

        public func getSerial() -> String {
            switch self {
            case .new:
                return "N" // 新布
            case .old:
                return "O" // 老布
            }
        }

        public static func find(from name: String) -> Age? {
            return Age.allCases.first { type in
                type.getName() == name
            }
        }
    }

    /// 顏色
    public enum Color: String, TypeCommon {
        case red // 紅色
        case orange // 橘色
        case yellow // 黃色
        case green // 綠色
        case blue // 藍色
        case purple // 紫色
        case pink // 粉色
        case peach // 桃色
        case brown // 大地色
        case black // 黑色
        case white // 白色
        case beige // 米色
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
                return "粉"
            case .peach:
                return "桃"
            case .brown:
                return "大地"
            case .black:
                return "黑"
            case .white:
                return "白"
            case .beige:
                return "米"
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

        public func getSerial() -> String {
            switch self {
            case .red:
                return "1" // 紅
            case .orange:
                return "2" // 橘
            case .yellow:
                return "3" // 黃
            case .green:
                return "4" // 綠
            case .blue:
                return "5" // 藍
            case .purple:
                return "6" // 紫
            case .pink:
                return "7" // 粉
            case .peach:
                return "8" // 桃
            case .brown:
                return "9" // 大地
            case .black:
                return "A" // 黑
            case .white:
                return "B" // 白
            case .beige:
                return "C" // 米
            case .grey:
                return "D" // 灰
            case .gold:
                return "E" // 金
            case .silvery:
                return "F" // 銀
            case .multi_color:
                return "G" // 彩色
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
            case .peach:
                return "#bb4780"
            case .brown:
                return "#7E4E20"
            case .black:
                return "#000000"
            case .white:
                return "#FEFEFE"
            case .beige:
                return "#E3DABC"
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

        public static func find(from name: String) -> Color? {
            return Color.allCases.first { type in
                type.getName() == name
            }
        }
    }

    /// 花色
    public enum Design: String, TypeCommon {
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
        case pop // 普普風

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
            case .pop:
                return "普普風"
            }
        }

        public func getSerial() -> String {
            switch self {
            case .plain:
                return "1" // 素色
            case .gradation:
                return "2" // 漸層
            case .block:
                return "3" // 色塊
            case .geometry:
                return "4" // 幾何
            case .stripe:
                return "5" // 條紋
            case .dot:
                return "6" // 點點
            case .plaid:
                return "7" // 格紋
            case .paisley:
                return "8" // 變形蟲
            case .totem:
                return "9" // 圖騰
            case .graffiti:
                return "A" // 塗鴉
            case .painting:
                return "B" // 油畫
            case .watercolor:
                return "C" // 水彩
            case .plant:
                return "D" // 植物
            case .animal:
                return "E" // 動物
            case .festival:
                return "F" // 節慶限定
            case .pop:
                return "G" // 普普風
            }
        }

        public static func find(from name: String) -> Design? {
            return Design.allCases.first { type in
                type.getName() == name
            }
        }
    }

    /// 倉庫位置
    public enum Location: String, TypeCommon {
        case chifeng // 赤峰店
        case chifengStorage // 赤峰倉庫
        case taipeiHome // 台北家
        case tainan // 台南店
        case tainanStorage // 台南倉庫
        case daxi // 大溪
        case aunt // 阿姨家
        case storeasy // 收多易
        case process // 製作中
        case finish // 製作完成

        public static func getKey() -> String {
            "location_type"
        }

        public func getName() -> String {
            switch self {
                case .chifeng:
                    return "赤峰店"
                case .chifengStorage:
                    return "赤峰倉庫"
                case .taipeiHome:
                    return "台北家"
                case .tainan:
                    return "台南店"
                case .tainanStorage:
                    return "台南倉庫"
                case .daxi:
                    return "大溪"
                case .aunt:
                    return "阿姨家"
                case .storeasy:
                    return "收多易"
                case .process:
                    return "製作中"
                case .finish:
                    return "製作完成"
            }
        }

        public static func find(from name: String) -> Location? {
            return Location.allCases.first { type in
                type.getName() == name
            }
        }
    }

    /// 尺寸
    public enum Size: String, TypeCommon {
        case freeSize
        case extraSmall
        case small
        case medium
        case large
        case short
        case long
        case narrow
        case wide

        public static func getKey() -> String {
            "size_type"
        }
        
        public func getName() -> String {
            switch self {
                case .freeSize:
                    return "F"
                case .extraSmall:
                    return "XS"
                case .small:
                    return "S"
                case .medium:
                    return "M"
                case .large:
                    return "L"
                case .short:
                    return "Short"
                case .long:
                    return "Long"
                case .narrow:
                    return "Narrow"
                case .wide:
                    return "Wide"
            }
        }
        
        public static func find(from name: String) -> Size? {
            return Size.allCases.first { type in
                type.getName() == name
            }
        }
    }
}
