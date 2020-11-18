//
//  TextExtensions.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 18/11/2020.
//

import SwiftUI

extension Text {
    
    func fullWidth(_ alignement: Alignment = .leading) -> some View {
        self.frame(minWidth: 0, maxWidth: .infinity, alignment: alignement)
    }
    
}
