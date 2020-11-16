//
//  PostmanInfo.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 16/11/2020.
//

import Foundation

struct PostmanInfo: Decodable {
    let postmanId: String
    let name: String
    let schema: String
    
    enum CodingKeys: String, CodingKey {
        case postmanId = "_postman_id"
        case name = "name"
        case schema = "schema"
    }
}
