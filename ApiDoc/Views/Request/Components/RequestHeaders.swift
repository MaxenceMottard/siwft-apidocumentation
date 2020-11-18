//
//  RequestHeaders.swift
//  ApiDoc
//
//  Created by Maxence Mottard on 18/11/2020.
//

import SwiftUI

struct RequestHeaders: View {
    let header: [PostmanVariable]
    
    var body: some View {
        VStack {
            Text("Headers")
                .font(.title3)
                .bold()
                .fullWidth()
            
            RequestRowView {
                Text("Header Field")
                    .fullWidth()
            } secondColumn: {
                Text("Value")
                    .fullWidth()
            }
            .foregroundColor(.gray)
            .padding(.vertical)
            
            Rectangle()
                .fill(Color.gray)
                .fullWidth()
                .frame(height: 1)
            
            ForEach(header, id: \.key) { value in
                RequestRowView {
                    Text(value.key)
                        .fullWidth()
                } secondColumn: {
                    Text(value.value)
                        .fullWidth()
                }
                .padding(.vertical, 3)
            }

        }
    }
}

struct RequestHeaders_Previews: PreviewProvider {
    static var previews: some View {
        let header = [
            PostmanVariable(key: "Authorization", value: "Your key"),
            PostmanVariable(key: "Content-Type", value: "application/json"),
        ]
        
        RequestHeaders(header: header)
            .previewLayout(PreviewLayout.sizeThatFits)
        
    }
}
