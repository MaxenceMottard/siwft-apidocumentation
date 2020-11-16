//
//  ProjectListItemViewModel.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 16/11/2020.
//

import Foundation
import SwiftUI

final class ProjectListItemViewModel: ObservableObject {
    @Injected var dependencyProvider: DependencyProvider
    
    var project: PostmanJSONV2!
    
    func displayName() -> String {
        return project.info.name
            .components(separatedBy: " ")
            .prefix(2)
            .reduce("") { "\($0)\($1.uppercased().first!)" }
    }
    
    func getProjectView() -> ProjectView {
        return dependencyProvider.resolve(ProjectView.self, argument: self.project!)!
    }
}
