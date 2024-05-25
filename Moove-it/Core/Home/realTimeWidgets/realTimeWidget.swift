//
//  realTimeWidget.swift
//  Moove-it
//
//  Created by Ang KS on 24/5/24.
//

import SwiftUI

struct widgetData{
    let lineCode: String
    let lineColor: Color
    let direction: String
    let Duration: String
}

struct realTimeWidget: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack(alignment: .center, spacing: 5){
                HStack(alignment: .center, spacing: 4){
                    Image(systemName: "tram.circle")
                        .font(.caption)
                        .fontWeight(.regular)
                    Text("TEL")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                }
                .fixedSize()
                .padding(.horizontal, 8)
                .padding(.vertical, 6)
                .foregroundStyle(Color.white)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                Text("towards")
                    .font(.subheadline)
                    .fontWeight(.regular)
                Text("Expo")
                    .font(.subheadline)
                    .fontWeight(.bold)
                
                Spacer()
            }
            HStack(alignment: .bottom, spacing: 5){
                Text("Arriving in:")
                    .font(.subheadline)
                Text("10 Minutes")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            
        }
        .padding()
        .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        .background(
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.thinMaterial)
                .shadow(color: .black.opacity(0.2), radius: 1)
        )
    }
}

#Preview {
    realTimeWidget()
}
