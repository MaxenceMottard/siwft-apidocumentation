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
    
    let buttonHeight: CGFloat = 70
    let hPadding: CGFloat = 8
    
    var body: some View {
        Button(action: {
            projectViewIsPresented = true
        }) {
            HStack {
                ProjectIconGradient {
                    Text(viewModel.displayName())
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .frame(width: buttonHeight - hPadding * 2, height: buttonHeight - hPadding * 2)
                .clipShape(Circle())
                
                VStack {
                    Text(viewModel.project.info.name)
                        .font(.title3)
                        .fontWeight(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("\(viewModel.project.numberOfRequests()) requêtes")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity)
                
                Spacer()
            }
            .foregroundColor(.textColorInversed)
            .padding(.horizontal, hPadding)
            .frame(height: buttonHeight)
            .background(Color.textColor)
            .cornerRadius(8.0)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
            .shadow(radius: 3)

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
        
        return Group {
            di.resolve(ProjectListItemView.self, argument: project)!
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .previewDisplayName("Light Mode")
            
            di.resolve(ProjectListItemView.self, argument: project)!
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark Mode")
        }
    }
}
