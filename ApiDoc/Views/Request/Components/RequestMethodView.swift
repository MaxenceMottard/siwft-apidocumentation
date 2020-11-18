//
//  RequestMethodView.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 18/11/2020.
//

import SwiftUI

struct RequestMethodView: View {
    
    let requestMethod: HTTPMethod
    
    var body: some View {
        VStack {
            ProjectItemRequestMethodView(requestMethod) {
                Text(requestMethod.rawValue)
                    .bold()
            }
            .cornerRadius(8.0)
        }
        .fullWidth(.leading)
    }
}

struct RequestMethodView_Previews: PreviewProvider {
    static var previews: some View {
        RequestMethodView(requestMethod: .DELETE)
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
        RequestMethodView(requestMethod: .POST)
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
        RequestMethodView(requestMethod: .GET)
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
        RequestMethodView(requestMethod: .PUT)
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}
