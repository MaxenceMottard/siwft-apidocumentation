//
//  ContentView.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 16/11/2020.
//

import SwiftUI

struct ProjectView: View {
    var viewModel: ProjectViewModel!
    
    var body: some View {
        ScrollView {
            VStack {
                Text(viewModel.project.info.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(.primaryColor)
                
                ProjectItemListView(list: viewModel.project.item)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .top)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .top)
            .padding()
            .padding(.top, 20)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ProjectView_Previews: PreviewProvider {
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
        
        let projectItem1 = PostmanItem(name: "My Folder", item: [request1], request: nil)
        
        let project = PostmanJSONV2(
            info: .init(postmanId: "ID_TEST_POSTMAN", name: "My Postman Test Project", schema: "noizhdascqlqs"),
            item: [projectItem1, request2, request1, request2],
            auth: .init(type: .bearer, bearer: []),
            variable: []
        )
        
        let di = DependencyProvider.shared
        
        return Group {
            di.resolve(ProjectView.self, argument: project)
        }
    }
}
