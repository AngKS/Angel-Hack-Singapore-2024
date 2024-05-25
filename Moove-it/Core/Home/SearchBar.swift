//
//  SearchBar.swift
//  Moove-it
//
//  Created by Ang KS on 24/5/24.
//

import SwiftUI

struct SearchBar: View {
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.purple)
            VStack(alignment: .leading, spacing: 2) {
                Text("Singapore")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(.purple)
                Text("Sentosa - Singapore Flyer - Marina Bay Sands")
                    .font(.caption2)
                    .foregroundStyle(.purple)
                    .opacity(0.4)
                
            }
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.purple)
                
            })
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .frame(
            width: UIScreen.main.bounds.width - 32,
            height: 60
        )
        .background(
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.2), radius: 2)
        )
    }
}

#Preview {
    SearchBar()
}
