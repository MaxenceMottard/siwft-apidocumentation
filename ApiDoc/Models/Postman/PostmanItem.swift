//
//  PostmanItem.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 16/11/2020.
//

import Foundation

struct PostmanItem: Decodable {
    let name: String
    let item: [PostmanItem]?
    let request: PostmanRequest?
}
