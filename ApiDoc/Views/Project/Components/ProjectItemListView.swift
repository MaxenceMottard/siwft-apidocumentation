//
//  ProjectItemListView.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 16/11/2020.
//

import SwiftUI

struct ProjectItemListView: View {
    let list: [PostmanItem]
    
    var body: some View {
        VStack {
            ForEach(list, id: \.name) { item in
                ProjectItemView(item: item)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .top)
            }
        }
    }
}

struct ProjectItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectItemView_Previews.previews
    }
}
