//
//  PostmanAuthBearer.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 16/11/2020.
//

import Foundation

struct PostmanAuthBearer: Decodable {
    let key: String
    let value: String
    let type: String
}
