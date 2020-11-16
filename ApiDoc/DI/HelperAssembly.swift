//
//  HelperAssembly.swift
//  FYD
//
//  Created by Maxence on 29/10/2020.
//  Copyright © 2020 Nicolas Barbosa. All rights reserved.
//

import Swinject
import UIKit

class HelperAssembly: Assembly {
    func assemble(container: Container) {
        //  Foundation
        container.register(JSONDecoder.self) { _ in JSONDecoder() }
        container.register(JSONEncoder.self) { _ in JSONEncoder() }
        
        
        //  Views
        container.register(ProjectListView.self) { _ in ProjectListView() }
        container.register(ProjectListViewModel.self) { _ in ProjectListViewModel() }
        
        container.register(ProjectListItemViewModel.self) { (_, project: PostmanJSONV2) -> ProjectListItemViewModel in
            let viewModel = ProjectListItemViewModel()
            viewModel.project = project

            return viewModel
        }
        container.register(ProjectListItemView.self) { (resolver, project: PostmanJSONV2) -> ProjectListItemView in
            var view = ProjectListItemView()
            view.viewModel = resolver.resolve(ProjectListItemViewModel.self, argument: project)!

            return view
        }
        
        container.register(ProjectViewModel.self) { (_, project: PostmanJSONV2) -> ProjectViewModel in
            let viewModel = ProjectViewModel()
            viewModel.project = project

            return viewModel
        }
        container.register(ProjectView.self) { (resolver, project: PostmanJSONV2) -> ProjectView in
            var view = ProjectView()
            view.viewModel = resolver.resolve(ProjectViewModel.self, argument: project)!

            return view
        }
        
        //  API
        
        
        //  Services
    }
}
