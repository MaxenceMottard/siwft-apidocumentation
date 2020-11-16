//
//  ProjectListViewItem.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 16/11/2020.
//

import SwiftUI

struct ProjectListItemView: View {
    var viewModel: ProjectListItemViewModel!
    @State var projectViewIsPresented = false
    
    var body: some View {
        Button(action: {
            projectViewIsPresented = true
        }) {
            HStack {
                Text(viewModel.project.info.name)
            }
        }.sheet(isPresented: $projectViewIsPresented) {
            viewModel.getProjectView()
        }
    }
}

struct ProjectListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let project = PostmanJSONV2(
            info: .init(postmanId: "ID_TEST_POSTMAN", name: "My Postman Test Project", schema: "noizhdascqlqs"),
            item: [],
            auth: .init(type: .bearer, bearer: []),
            variable: []
        )
        
        let di = DependencyProvider.shared
        
        return di.resolve(ProjectListItemView.self, argument: project)
    }
}
