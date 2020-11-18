//
//  PostmanAuth.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 16/11/2020.
//

import Foundation

struct PostmanAuth: Decodable {
    let type: PostmanAuthType
    let bearer: [PostmanVariable]
}
