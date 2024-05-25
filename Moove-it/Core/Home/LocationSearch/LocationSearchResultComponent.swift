//
//  LocationSearchResultComponent.swift
//  Moove-it
//
//  Created by Ang KS on 25/5/24.
//

import SwiftUI

struct LocationSearchResultComponent: View {
        
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack{
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.purple)
                .accentColor(.white)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 3){
                Text(title)
                    .font(.body)
                
                Text(subtitle)
                    .font(.system(size: 15))
                    .foregroundStyle(.gray)
                
                Divider()
            }
            .padding(.leading, 8)
            .padding(.vertical, 8)
            
        }
        .padding(.leading)
    }
}

#Preview {
    LocationSearchResultComponent(title: "Starbucks", subtitle: "123 Palm Drive")
}
