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
                            .fullWidth()
                        
                        Text("\(item.numberOfRequests()) requêtes")
                            .fullWidth()
                    }
                    .padding(.leading, 15)
                    
                    Spacer()
                    
                    Image(systemName: "arrowtriangle.down.fill")
                        .font(.system(size: 20.0))
                        .foregroundColor(.primaryColor)
                        .rotationEffect(.degrees(dropDropwIsExpanded ? 0 : 180))
                }
                .padding(10)
                .fullWidth()
                .background(Color.textColor)
                .foregroundColor(.textColorInversed)
                .cornerRadius(8.0)
                .shadow(radius: 3)
            }, expandedView: {
                ProjectItemListView(list: item.item!)
                    .padding(.bottom, 15)
            }, isExpanded: $dropDropwIsExpanded)
            .fullWidth()
            .padding(.vertical, 5)
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
            
            ProjectItemView(item: projectItem, dropDropwIsExpanded: true)
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .previewDisplayName("Light Mode Expanded")
            
            ProjectItemView(item: projectItem)
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark Mode")
            
            ProjectItemView(item: projectItem, dropDropwIsExpanded: true)
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark Mode Expanded")
        }
    }
}
