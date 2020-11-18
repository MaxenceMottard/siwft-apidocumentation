//
//  PostmanService.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 16/11/2020.
//

import Foundation

class PostmanService {
    
    private var currentProject: PostmanJSONV2? = nil
    
    func getCurrentProject() -> PostmanJSONV2? {
        return currentProject
    }
    
    func setCurrentPorject(_ project: PostmanJSONV2) {
        currentProject = project
    }
    
    func resetCurrentProject() {
        currentProject = nil
    }
    
}
