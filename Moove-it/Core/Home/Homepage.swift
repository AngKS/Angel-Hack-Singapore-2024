//
//  Homepage.swift
//  Moove-it
//
//  Created by Ang KS on 24/5/24.
//

import SwiftUI

struct Homepage: View {
    @State private var mapState = MapViewState.noInput
    @State public var selectedLocationTitle: String = "Something"
    @State public var selectedLocationSubtitle: String = "Nothing"
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                ZStack(alignment: .topLeading) {
                    VStack{
                        Spacer()
                            .frame(
                                width: UIScreen.main.bounds.width,
                                height: 150
                            )
                        ReelMapViewRepresentable(mapState: $mapState)
                            .ignoresSafeArea()
                    }
                    if mapState == .noInput || mapState == .locationSelected {
                        VStack{
                            Text("Hello, AKS")
                                .font(.title)
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                            
                            SearchBar(
                                mapState: $mapState,
                                selectedLocationTitle: $selectedLocationTitle,
                                selectedLocationSubtitle: $selectedLocationSubtitle
                            )
                            .padding(.horizontal)
                            .onTapGesture(perform: {
                                withAnimation(.spring()){
                                    mapState = .searchingForLocation
                                }
                            })
                            
                            smallTabUtilities()
                                .padding(.horizontal)
                                .padding(.bottom, 8)
                        }
                        .background(.thinMaterial)
                        .shadow(color: .black.opacity(0.2), radius: 8)
                    }
                    else if mapState == .searchingForLocation{
                        LocationSearchView(mapState: $mapState, selectedLocationTitle: $selectedLocationTitle, selectedLocationSubtitle: $selectedLocationSubtitle)
                        
                    }
                    
                    
                }
                
//              
            }
        
            
            
        }
    }
}

#Preview {
    Homepage()
}
