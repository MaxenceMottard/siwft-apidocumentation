//
//  RequestURLView.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 18/11/2020.
//

import SwiftUI

struct RequestURLView: View {
    let requestUrl: PostmanUrl
    
    var body: some View {
        VStack {
            Text("URL")
                .font(.title3)
                .bold()
                .fullWidth()
            Text(requestUrl.url())
                .bold()
                .fullWidth()
        }
    }
}

struct RequestURLView_Previews: PreviewProvider {
    static var previews: some View {
        let url = PostmanUrl(
            raw: "https://google.com/search?q=Test",
            host: ["google", "com"], path: ["search"], httpProtocol: "https",
            query: [PostmanVariable(key: "q", value: "Test")],
            variable: nil
        )
        
        RequestURLView(requestUrl: url)
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}
