//
//  RequestRowView.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 18/11/2020.
//

import SwiftUI

struct RequestRowView<A: View, B: View>: View {
    
    let firstColumn: A
    let secondColumn: B
    
    init(firstColumn: () -> (A), secondColumn: () -> (B)) {
        self.firstColumn = firstColumn()
        self.secondColumn = secondColumn()
    }
    var body: some View {
        GeometryReader { geo in
            HStack {
                firstColumn
                    .frame(width: geo.size.width * 0.5)
                secondColumn
                    .frame(width: geo.size.width * 0.5)
            }
        }
    }
}

struct RequestRowView_Previews: PreviewProvider {
    static var previews: some View {
        RequestRowView {
            Rectangle()
                .fill(Color.red)
                .fullWidth()
        } secondColumn: {
            Rectangle()
                .fill(Color.blue)
                .fullWidth()
        }
        .previewLayout(PreviewLayout.sizeThatFits)
        .frame(width: 300, height: 70)
        .padding()
        .previewDisplayName("Expanded")

    }
}
