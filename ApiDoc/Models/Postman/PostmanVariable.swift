//
//  PostmanVariable.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 16/11/2020.
//

import Foundation

struct PostmanVariable: Decodable {
    let id: String?
    let key: String
    let value: String
    let disabled: Bool?
    let type: String?
}
