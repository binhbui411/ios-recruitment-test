//
//  ItemModel.swift
//  iOSRecruitmentTest
//
//  Created by szymon on 29.03.2017.
//  Copyright © 2017 Snowdog. All rights reserved.

import ObjectMapper

class ItemModel: Mappable {
    
    var id: Int?
    var name: String?
    var description: String?
    var icon: String?
    var timestamp: Double?
    var url: String?
    
    // MARK: - Init
    
    required init?(map: Map) {
        if map.JSON["id"] == nil {
            return nil
        }
    }
    
    // MARK: - Mappable
    
    func mapping(map: Map) {
        self.id <- map["id"] //z json do tablicy
        self.name <- map["name"]
        self.description <- map["description"]
        self.icon <- map["icon"]
        self.timestamp <- map["timestamp"]
        self.url <- map["url"]
    }
}
