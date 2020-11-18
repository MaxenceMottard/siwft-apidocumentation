//
//  ProjectRequestView.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 16/11/2020.
//

import SwiftUI

struct ProjectItemRequestView: View {
    let item: PostmanItem
    @State var detailIsPresented = false
    @AppStorage("displayRequestEndpoint") var displayRequestEndpoint = false
    
    var body: some View {
        Button(action: {
            detailIsPresented = true
        }) {
            ProjectItemRequestMethodView(item.request!.method) {
                VStack {
                    Text("[\(item.request!.method.rawValue)]")
                        .bold()
                        .font(.caption)
                        .fullWidth()
                    
                    Text(displayRequestEndpoint
                            ? item.request!.url.endpoint()
                            : item.name
                    )
                    .bold()
                    .fullWidth()
                }
            }
            .fullWidth(.leading)
            .background(Color.textColor)
            .cornerRadius(8.0)
            .padding(.leading, 20)
            .foregroundColor(.textColorInversed)
            .shadow(radius: 3)
        }.sheet(isPresented: $detailIsPresented) {
            RequestView(requestItem: item)
        }
        .padding(.top, 8)
    }
}

struct ProjectItemRequestView_Previews: PreviewProvider {
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
            ProjectItemRequestView(item: request)
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .previewDisplayName("Light Mode")
            
            ProjectItemRequestView(item: request)
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark Mode")
        }
    }
}
