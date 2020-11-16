//
//  PostmanRequest.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 16/11/2020.
//

import Foundation

struct PostmanRequest: Decodable {
    let method: HTTPMethod
    let header: [PostmanVariable]
    let body: PostmanBody?
    let url: PostmanUrl
}
