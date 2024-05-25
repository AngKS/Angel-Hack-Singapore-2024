//
//  LocationSearchActivation.swift
//  Moove-it
//
//  Created by Ang KS on 25/5/24.
//

import SwiftUI

struct LocationSearchView: View {
        
    @State private var startLocationText = ""
    @Binding var showLocationSearch: Bool
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    
    var body: some View {
        VStack{
            // Header View
            HStack{
                Button(
                    action: {
                        withAnimation(.spring()){
                            showLocationSearch.toggle()
                        }
                    }, label: {
                        
                        HStack(spacing: 6){
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundStyle(Color.purple)
                    })
                Spacer()
                          
            }
            .padding(.top, 10)
            .padding(.horizontal)
            Group{
                
            }
            
            HStack {
                VStack(){
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 32)
                    
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color.black)
                        .frame(width: 6, height: 6)
                }
                
                VStack(){
                    TextField("Current Location", text: $startLocationText)
                        .frame(height: 48)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 0.3)
                                .foregroundStyle(Color(.systemGroupedBackground))
                                
                        )
                        .background(Color(.systemGroupedBackground))
                        

                    TextField("Where to?", text: $viewModel.queryFragment)
                        .frame(height: 48)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 0.3)
                                .foregroundStyle(Color(.systemGray4))
                        )
                        .background(Color(.systemGray4))
                    
                }
                
                
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            Divider()
                .padding(.vertical)
            // List View
            ScrollView{
                LazyVStack(alignment: .leading){
                    ForEach(viewModel.results, id: \.self) { result in
                        LocationSearchResultComponent(title: result.title, subtitle: result.subtitle)
                            .onTapGesture {
                                withAnimation(.easeOut(duration: 0.8)){
                                    viewModel
                                        .selectLocation(result.title)
                                    showLocationSearch.toggle()
                                }
                            }
                    }
                    
                }
            }
        }
        .background(.white)
        
    }
}

#Preview {
    LocationSearchView(showLocationSearch: .constant(true))
}
