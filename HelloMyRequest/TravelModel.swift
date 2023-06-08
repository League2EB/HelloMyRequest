//
//  TrivalModel.swift
//  HelloMyRequest
//
//  Created by League2eb on 2023/6/8.
//  Copyright © 2023 Lazy. All rights reserved.
//

import Foundation

struct TravelModel: Decodable {

    var status: String = ""
    var pagecount: String = ""
    var data: [TravelData] = []

    enum CodingKeys: CodingKey {
        case data
        case status
        case pagecount
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decodeIfPresent([TravelData].self, forKey: .data) ?? []
        self.status = try container.decodeIfPresent(String.self, forKey: .status) ?? ""
        self.pagecount = try container.decodeIfPresent(String.self, forKey: .pagecount) ?? ""
    }
}


struct TravelData: Decodable {
    var name: String = ""
    var id: String = ""
    var travel_status: String = ""
    var price: String = ""
    var member_price: String = ""
    var img: String = ""
    var city: String = ""
    var memo_2: String = ""
    var slogan: [TrivalModelDataSlogan] = []
    var day: String = ""
    var date: String = ""
    var from_city: String = ""
    var promotion: String = ""
    var amount_1: String = ""
    var amount_2: String = ""
    var amount_3: String = ""
    var talent: String = ""

    enum CodingKeys: String, CodingKey {
        case name, id, travel_status, price, member_price, img, city, memo_2, slogan, day, date, from_city, promotion, amount_1, amount_2, amount_3, talent
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        self.travel_status = try container.decodeIfPresent(String.self, forKey: .travel_status) ?? ""
        self.price = try container.decodeIfPresent(String.self, forKey: .price) ?? ""
        self.member_price = try container.decodeIfPresent(String.self, forKey: .member_price) ?? ""
        self.img = try container.decodeIfPresent(String.self, forKey: .img) ?? ""
        self.city = try container.decodeIfPresent(String.self, forKey: .city) ?? ""
        self.memo_2 = try container.decodeIfPresent(String.self, forKey: .memo_2) ?? ""
        self.slogan = try container.decodeIfPresent([TrivalModelDataSlogan].self, forKey: .slogan) ?? []
        self.day = try container.decodeIfPresent(String.self, forKey: .day) ?? ""
        self.date = try container.decodeIfPresent(String.self, forKey: .day) ?? ""
        self.from_city = try container.decodeIfPresent(String.self, forKey: .from_city) ?? ""
        self.promotion = try container.decodeIfPresent(String.self, forKey: .promotion) ?? ""
        self.amount_1 = try container.decodeIfPresent(String.self, forKey: .amount_1) ?? ""
        self.amount_2 = try container.decodeIfPresent(String.self, forKey: .amount_2) ?? ""
        self.amount_3 = try container.decodeIfPresent(String.self, forKey: .amount_3) ?? ""
        self.talent = try container.decodeIfPresent(String.self, forKey: .talent) ?? ""
    }
}

struct TrivalModelDataSlogan: Decodable {
    var price1: String = ""
    var title: String = ""
    var type: String = ""

    enum CodingKeys: String, CodingKey {
        case price1, title, type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.price1 = try container.decodeIfPresent(String.self, forKey: .price1) ?? ""
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
    }
}
