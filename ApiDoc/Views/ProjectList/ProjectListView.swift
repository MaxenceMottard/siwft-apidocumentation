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
            VStack {
                ForEach(viewModel.projects, id: \.info.postmanId) { project in
                    viewModel.getItem(project)
                }
            }
        }
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView()
    }
}
