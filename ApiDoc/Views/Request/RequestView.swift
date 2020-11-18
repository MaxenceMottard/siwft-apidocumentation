//
//  RequestView.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 17/11/2020.
//

import SwiftUI

struct RequestView: View {
    let requestItem: PostmanItem
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ScrollView {
                    VStack {
                        //  MARK: Method
                        RequestMethodView(requestMethod: requestItem.request!.method)
                        .padding()
                        
                        //  MARK: URL
                        RequestURLView(requestUrl: requestItem.request!.url)
                            .padding()
                        
                        //  MARK: Headers
                        RequestHeaders(header: requestItem.request!.header)
                            .padding()
                    }
                }
                .padding(.top, geo.safeAreaInsets.top)
                
                VStack (alignment: .leading) {
                    Text(requestItem.name).fullWidth()
                    Text(requestItem.request!.url.endpoint()).fullWidth()
                }
                .padding()
                .padding(.bottom, geo.safeAreaInsets.bottom)
                .fullWidth()
                .background(Color.httmMethod(requestItem.request!.method))
                .foregroundColor(.white)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct RequestView_Previews: PreviewProvider {
    static var previews: some View {
        let request = PostmanItem(
            name: "My first Request",
            item: nil,
            request: PostmanRequest(
                method: .GET, header: [
                    .init(key: "Authorization", value: "Your key"),
                    .init(key: "Content-Type", value: "application/json"),
                ],
                body: PostmanBody(mode: .raw, raw: "", urlencoded: nil),
                url: PostmanUrl(
                    raw: "https://google.com/search?q=Test",
                    host: ["google", "com"], path: ["search"], httpProtocol: "https",
                    query: [PostmanVariable(key: "q", value: "Test")],
                    variable: nil
                )
            )
        )
        
        return Group {
            RequestView(requestItem: request)
                .edgesIgnoringSafeArea(.all)
                .previewDisplayName("Light Mode")
                .previewLayout(PreviewLayout.sizeThatFits)
            
            RequestView(requestItem: request)
                .background(Color(.systemBackground))
                .edgesIgnoringSafeArea(.all)
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark Mode")
        }
    }
}
