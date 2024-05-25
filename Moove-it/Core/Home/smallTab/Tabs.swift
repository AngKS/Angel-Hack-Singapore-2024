//
//  Tabs.swift
//  Moove-it
//
//  Created by Ang KS on 24/5/24.
//

import SwiftUI

struct Tabs: View {
    public var icon: String
    public var text: String
    public var color: Color
    public var disabled: Bool

//    @Binding public var btnAction
    
    var body: some View {
    
        Button(
            action: {},
            label: {
                HStack {
                    Image(systemName: icon)
                        .foregroundStyle(Color(color))
                    Text(text)
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.purple.opacity(0.8))
                        
                    
                    
                }
            }
        )
        .disabled(disabled)
        .padding(.horizontal)
        .padding(.vertical, 12)
        .fixedSize()
        .background(
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(Color.white)
                .shadow(color: .purple.opacity(0.3), radius: 1)
        )
        
    }
}

#Preview {
    Tabs(icon: "map", text: "MRT Map", color: Color.green, disabled: false)
}
