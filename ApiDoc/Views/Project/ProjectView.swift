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
        Text(viewModel.project.info.name)
            .padding()
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
    }
}
