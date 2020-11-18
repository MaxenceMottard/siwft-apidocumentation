//
//  PostmanUrl.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 16/11/2020.
//

import Foundation

struct PostmanUrl: Decodable {
    let raw: String
    let host: [String]
    let path: [String]
    let httpProtocol: String?
    let query: [PostmanVariable]?
    let variable: [PostmanVariable]?
    
    enum CodingKeys: String, CodingKey {
        case raw = "raw"
        case host = "host"
        case path = "path"
        case httpProtocol = "protocol"
        case variable = "variable"
        case query = "query"
    }
    
    func url() -> URL? {
        return URL(string: self.url())!
    }
    
    func url() -> String {
        let urlProtocol = httpProtocol != nil ? "\(httpProtocol!)://" : ""
        let host = self.host.joined(separator: ".")
        let path = endpoint()
        
        return urlProtocol + host + path
    }
    
    func endpoint() -> String {
        return self.path.reduce("") { "\($0)/\($1)" }
    }
}
