//
//  SearchBar.swift
//  Moove-it
//
//  Created by Ang KS on 24/5/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var mapState: MapViewState
    @Binding var selectedLocationTitle: String
    @Binding var selectedLocationSubtitle: String
    
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        if mapState == .locationSelected {
            HStack{
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(selectedLocationTitle)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.purple)
                    Text(selectedLocationSubtitle)
                        .font(.caption2)
                        .foregroundStyle(.purple)
                        .opacity(0.4)
                    
                }
                Spacer()
                
                Button(action: {
                    selectedLocationTitle = ""
                    selectedLocationSubtitle = ""
                    withAnimation(.spring()){
                        mapState = .noInput
                    }
                }, label: {
                    Image(systemName: "xmark.circle.fill")
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
        else{
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
}

#Preview {
    SearchBar(mapState: .constant(.noInput), selectedLocationTitle: .constant("Test Location"), selectedLocationSubtitle: .constant("123 Palm Drive"))
}
