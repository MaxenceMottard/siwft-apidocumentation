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
    
    func getProjectView() -> ProjectView {
        return dependencyProvider.resolve(ProjectView.self, argument: self.project!)!
    }
}
