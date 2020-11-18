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
                        Spacer()
                    }
                }
                
                VStack (alignment: .leading) {
                    Text(requestItem.name)
                }
                .padding()
                .padding(.bottom, geo.safeAreaInsets.bottom)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.httmMethod(requestItem.request!.method))
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
                method: .GET, header: [],
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
            
            RequestView(requestItem: request)
                .background(Color(.systemBackground))
                .edgesIgnoringSafeArea(.all)
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark Mode")
        }
    }
}
