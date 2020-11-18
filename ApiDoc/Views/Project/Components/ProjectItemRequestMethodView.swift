//
//  ProjectRequestMethod.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 17/11/2020.
//

import SwiftUI

struct ProjectItemRequestMethodView<C: View> : View {
    let childView: C
    let method: HTTPMethod
    
    init(_ method: HTTPMethod, childView: () -> (C)) {
        self.childView = childView()
        self.method = method
    }
    
    var body: some View {
        VStack {
            childView
                .fullWidth()
                .padding()
                .background(Color.httmMethod(method))
                .foregroundColor(.white)
        }
    }
}

struct ProjectItemRequestMethodView_Previews: PreviewProvider {
    static var previews: some View {
        let child = Text("Test")
        
        return Group {
            ProjectItemRequestMethodView(.DELETE) {
                child
            }
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
            .previewDisplayName(HTTPMethod.DELETE.rawValue)
            
            ProjectItemRequestMethodView(.GET) {
                child
            }
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
            .previewDisplayName(HTTPMethod.GET.rawValue)
            
            ProjectItemRequestMethodView(.PUT) {
                child
            }
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
            .previewDisplayName(HTTPMethod.PUT.rawValue)
            
            ProjectItemRequestMethodView(.POST) {
                child
            }
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
            .previewDisplayName(HTTPMethod.POST.rawValue)
        }
    }
}
