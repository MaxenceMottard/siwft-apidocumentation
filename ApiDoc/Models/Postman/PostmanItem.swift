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
    
    func numberOfRequests() -> Int {
        if let items = self.item {
            return items.reduce(0) { (accumulator, item) -> Int in
                return accumulator + item.numberOfRequests()
            }
        }
        
        if let _ = request {
            return 1
        }
        
        return 0
    }
}
