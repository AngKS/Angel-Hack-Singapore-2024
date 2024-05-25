//
//  Blogposts.swift
//  Moove-it
//
//  Created by Ang KS on 26/5/24.
//

import SwiftUI

struct Blogposts: View {
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .frame(width: 100, height: 100)
                
            VStack(alignment: .leading, spacing: 15){
                Text("Title of Blog Post")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("lorem ipsum dolor whatever this is amazing LMAO ahahhahaha")
                    .lineLimit(2)
                    .font(.caption)
                Divider()
                    
            }
            
        }
        .padding(.horizontal)
        
    }
}

struct BlogPostData {
    let title: String
    let caption: String
    let imageURI: String
    let link: String
}

#Preview {
    Blogposts()
}
