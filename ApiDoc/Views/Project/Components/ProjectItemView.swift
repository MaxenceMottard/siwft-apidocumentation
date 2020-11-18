//
//  ProjectItemView.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 16/11/2020.
//

import SwiftUI

struct ProjectItemView: View {
    let item: PostmanItem
    @State var dropDropwIsExpanded: Bool = false
    
    var body: some View {
        if let _ = item.request {
            ProjectItemRequestView(item: item)
        } else {
            DropDown({
                HStack {
                    Image(systemName: "folder.fill")
                        .font(.system(size: 20.0))
                        .foregroundColor(.primaryColor)
                    
                    VStack {
                        Text(item.name)
                            .bold()
                            .font(.title3)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(item.numberOfRequests()) requêtes")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.leading, 15)
                    
                    Spacer()
                    
                    Image(systemName: "arrowtriangle.down.fill")
                        .font(.system(size: 20.0))
                        .foregroundColor(.primaryColor)
                        .rotationEffect(.degrees(dropDropwIsExpanded ? 0 : 180))
                }
                .padding(10)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .background(Color.textColor)
                .foregroundColor(.textColorInversed)
                .cornerRadius(8.0)
                .shadow(radius: 3)
            }, expandedView: {
                ProjectItemListView(list: item.item!)
            }, isExpanded: $dropDropwIsExpanded)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 20)
        }
    }
}

struct ProjectItemView_Previews: PreviewProvider {
    static var previews: some View {
        let request1 = PostmanItem(
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
        
        let request2 = PostmanItem(
            name: "My second Request",
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
        
        let projectItem = PostmanItem(name: "My Folder", item: [request1, request2], request: nil)
        
        return Group {
            ProjectItemView(item: projectItem)
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .previewDisplayName("Light Mode")
            
            ProjectItemView(item: projectItem)
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark Mode")
        }
    }
}
