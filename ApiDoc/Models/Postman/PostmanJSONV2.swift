//
//  PostmanJSONV2.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 16/11/2020.
//

import Foundation

struct PostmanJSONV2: Decodable {
    let info: PostmanInfo
    let item: [PostmanItem]
    let auth: PostmanAuth
    let variable: [PostmanVariable]
//    let protocolProfileBehaviour: Any
    
    func numberOfRequests() -> Int {
        return item
            .map { $0.numberOfRequests() }
            .reduce(0) { $0 + $1 }
    }
}
