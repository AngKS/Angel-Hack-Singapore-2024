//
//  BottomInformationSheet.swift
//  Moove-it
//
//  Created by Ang KS on 26/5/24.
//

import SwiftUI

struct BottomInformationSheet: View {
    
    @Binding var mapState: MapViewState
    
    var body: some View {
        VStack{
            Capsule()
                .foregroundStyle(Color(.systemGray5))
                .frame(width: 48, height: 6)
            
            // Header
            HStack{
                Text("Lemon8 Blog")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(Color(.black))
                    
                })
                
            }
            
            // Scrollable information
            ScrollView{
                ForEach(0 ... 200, id: \.self){post in
                        Blogposts()
                        .padding(.bottom, 40)
                    
                }
            }
        }
        .padding()
        .background(.white)
        .swipeActions(edge: .leading, content: {
            
        })
    }
}

#Preview {
    BottomInformationSheet(mapState: .constant(.noInput))
}
