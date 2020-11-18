//
//  DropDown.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 18/11/2020.
//

import SwiftUI

struct DropDown<A: View, B: View>: View {
    
    let initialView: A
    let expandedView: B
    
    @Binding var isExpanded: Bool
    
    init(_ initialView: () -> (A), expandedView: () -> (B), isExpanded isExpandedBinding: Binding<Bool>) {
        self.initialView = initialView()
        self.expandedView = expandedView()
        self._isExpanded = isExpandedBinding
    }
    
    var body: some View {
        
        VStack {
            initialView
                .onTapGesture {
                    isExpanded.toggle()
                }
            
            if isExpanded {
                expandedView
            }
        }
        .animation(.spring())
        
    }
}

struct DropDown_Previews: PreviewProvider {
//    @State var isExpanded: Bool = false
    
    static var previews: some View {
//        DropDown({
//            HStack {
//                Text("Initial View")
//                Image(systemName: "arrowtriangle.down.fill")
//                    .font(.system(size: 20.0))
//            }
//        }, expandedView: {
//            VStack {
//                Text("Expanded View")
//            }
//        }, isExpandedBinding: $isExpanded)
        Text("anavailable")
    }
}
