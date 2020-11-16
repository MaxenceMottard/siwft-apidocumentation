//
//  PostmanBody.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 16/11/2020.
//

import Foundation

struct PostmanBody: Decodable {
    let mode: PostmanBodyMode?
    let raw: String?
    let urlencoded: [PostmanVariable]?
//    let options: Any
}

enum PostmanBodyMode: String, Decodable {
    case raw, urlencoded
}
