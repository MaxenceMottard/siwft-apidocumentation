//
//  ProjectListView.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 16/11/2020.
//

import SwiftUI

struct ProjectListView: View {
    
    @InjectedObservedObject private var viewModel: ProjectListViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            Text("Liste des projets")
                .font(.title)
                .bold()
            
            VStack(alignment: .center, spacing: 15) {
                ForEach(viewModel.projects, id: \.info.postmanId) { project in
                    viewModel.getItem(project)
                }
            }.padding()
        }
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView()
            .previewDisplayName("LightMode")
        
        ProjectListView()
            .background(Color(.systemBackground))
            .environment(\.colorScheme, .dark)
            .previewDisplayName("Dark Mode")
    }
}
