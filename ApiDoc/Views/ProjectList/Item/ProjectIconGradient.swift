//
//  ProjectIconGradient.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 16/11/2020.
//

import SwiftUI

struct ProjectIconGradient<C: View> : View {
    let childView: C
    
    init(_ childView: () -> (C)) {
        self.childView = childView()
    }
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color.primaryColor, location: 0),
                    .init(color: Color.secondaryColor, location: 0.9),
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            childView
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
    }
}


struct ProjectIconGradient_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ProjectIconGradient {
                Text("ok")
            }
        }
        .previewLayout(PreviewLayout.sizeThatFits)
        .padding()
        .frame(width: 350, height: 120)
    }
}

