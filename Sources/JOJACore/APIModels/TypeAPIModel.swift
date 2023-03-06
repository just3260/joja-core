
import Foundation

public struct TypeAPIModel: Codable {
    
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
    }
    
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
    }
    
    public enum Employee: String, Codable, CaseIterable {
        case josie // Josie
        case jn // 黃潔恩
        case yo_ya // 張由亞
        case yuu // 陳郁
        case yi_fan // 李宜凡
        case andrew // Andrew
    }
    
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
    }
    
    public enum OtherGoods: String, Codable, CaseIterable {
        case clip_earrings // 夾式耳環
        case pin_earrings // 針式耳環
        case mask_chain // 口罩鍊
        case necklace // 項鍊
        case bracelet // 手鍊
        case pin // 別針
        case ring // 戒指
        case other // 其他
    }
    
    public enum Material: String, Codable, CaseIterable {
        case cotton_wash // 素棉（水洗）
        case cotton_bubble // 素棉（泡泡）
        case calico_cotton // 印花（棉紗）
        case calico_new // 印花（新布）
        case calico_old // 印花（老布）
        case wool_old // 毛料-老花
        case wool // 毛料（一般）
        case flannel // 絨布（素色）
        case flannel_old // 絨布（老花）
        case suit // 西裝料
        case linen_old // 麻（老）
        case linen_new // 麻（新）
        case synthetic_fiber_old // 合成纖維（老）
        case synthetic_fiber_new // 合成纖維（新）
        case headbands_opaque // 領/髮（不透明）
        case headbands_translucent // 領/髮（半透明）
        case silk // 絲
    }
    
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
    }
    
    public enum ColorType: String, Codable, CaseIterable {
        case red // 紅色
        case orange // 橘色
        case yellow // 黃色
        case green // 綠色
        case blue // 藍色
        case purple // 紫色
        case pink // 粉色
        case peach // 粉色
        case brown // 大地色
        case black // 黑色
        case white // 白色
        case grey // 灰色
        case gold // 金色
        case silvery // 銀色
        case multi_color // 彩色
    }
    
    public let id: UUID
    public let goods: String
    public let types: GoodsType
    public let amount: Int
    public let note: String?
    public let buyerID: UUID
    public let createdAt: Date?
    
    public init(
        id: UUID,
        goods: String,
        types: GoodsType,
        amount: Int,
        note: String?,
        buyerID: UUID,
        createdAt: Date?
    ) {
        self.id = id
        self.goods = goods
        self.types = types
        self.amount = amount
        self.note = note
        self.buyerID = buyerID
        self.createdAt = createdAt
    }
}
