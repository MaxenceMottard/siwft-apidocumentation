//
//  Method.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 16/11/2020.
//

import Foundation

enum HTTPMethod: String, Decodable, CaseIterable {
    case POST, GET, PUT, DELETE
}
