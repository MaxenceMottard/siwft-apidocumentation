//
//  ProjectListViewModel.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 16/11/2020.
//

import Foundation

final class ProjectListViewModel: ObservableObject {
    @Published var projects: [PostmanJSONV2] = []
    @Injected private var jsonDecoder: JSONDecoder
    @Injected private var dependencyProvider: DependencyProvider
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        do {
            let path = Bundle.main.path(forResource: "RandoAPI.postman_collection", ofType: "json")!
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let decodedData = try jsonDecoder.decode(PostmanJSONV2.self, from: data)
            
            projects = [decodedData]
            
            #if DEBUG
            let path2 = Bundle.main.path(forResource: "Selfbuy.postman_collection", ofType: "json")!
            let data2 = try Data(contentsOf: URL(fileURLWithPath: path2), options: .mappedIfSafe)
            let decodedData2 = try jsonDecoder.decode(PostmanJSONV2.self, from: data2)
            
            projects.append(decodedData2)
            #endif
        } catch let error {
            projects = []
            print(error)
        }
    }
    
    func getItem(_ project: PostmanJSONV2) -> ProjectListItemView {
        return dependencyProvider.resolve(ProjectListItemView.self, argument: project)!
    }
    
}
