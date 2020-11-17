//
//  PostmanVariable.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 16/11/2020.
//

import Foundation

struct PostmanVariable: Decodable {
    var id: String? = nil
    let key: String
    let value: String
    var disabled: Bool? = nil
    var type: String? = nil
}
