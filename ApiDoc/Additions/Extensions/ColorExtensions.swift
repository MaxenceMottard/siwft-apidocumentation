//
//  ColorExtensions.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 16/11/2020.
//

import SwiftUI

extension Color {
    
    static let textColor = Color("TextColor")
    static let textColorInversed = Color("TextColorInversed")
    static let primaryColor = Color("PrimaryColor")
    static let secondaryColor = Color("SecondaryColor")
    
    static func httmMethod(_ method: HTTPMethod) -> Color {
        switch method {
        case .GET:
            return Color.green
        case .DELETE:
            return Color.red
        case .PUT:
            return Color.blue
        case .POST:
            return Color.orange
        }
    }
}
