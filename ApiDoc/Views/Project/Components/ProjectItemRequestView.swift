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
    @InjectedObservedObject var userDefault: UserDefaultService
    
    var body: some View {
        Button(action: {
            detailIsPresented = true
        }) {
            HStack {
                Text("[\(item.request!.method.rawValue)]")
                    .foregroundColor(.httmMethod(item.request!.method))
                    .bold()
                    .frame(width: 80, alignment: .center)
                
                ProjectItemRequestMethodView(item.request!.method) {
                    Text(item.name)
                        .bold()
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .background(Color.textColor)
                .cornerRadius(8.0)
                .foregroundColor(.textColorInversed)
                .shadow(radius: 3)
            }
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
