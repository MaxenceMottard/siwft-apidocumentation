//
//  ViewExtensions.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 18/11/2020.
//

import SwiftUI

extension View {
    
    func fullWidth(_ alignement: Alignment = .center) -> some View {
        self.frame(minWidth: 0, maxWidth: .infinity, alignment: alignement)
    }
    
    func fullHeight(_ alignement: Alignment = .center) -> some View {
        self.frame(minHeight: 0, maxHeight: .infinity, alignment: alignement)
    }
    
}
