//
//  Homepage.swift
//  Moove-it
//
//  Created by Ang KS on 24/5/24.
//

import SwiftUI

struct Homepage: View {
    @State private var showLocationSearch = false
    
    var body: some View {
        NavigationStack {
            if !showLocationSearch {
                ZStack(alignment: .topLeading) {
                    
                    ReelMapViewRepresentable()
                        .ignoresSafeArea()
                    
                    VStack{
                        Text("Hello, AKS")
                            .font(.title)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                        
                        SearchBar()
                            .padding(.horizontal)
                            .onTapGesture(perform: {
                                withAnimation(.spring()){
                                    showLocationSearch.toggle()
                                }
                            })
                        
                        smallTabUtilities()
                            .padding(.horizontal)
                            .padding(.bottom, 8)
                        
                    }
                    .background(.thinMaterial)
                    .shadow(color: .black.opacity(0.2), radius: 8)
                    
                    

                }
                
            }
            else{
                LocationSearchView(showLocationSearch: $showLocationSearch)

            }
            
            
        }
    }
}

#Preview {
    Homepage()
}
