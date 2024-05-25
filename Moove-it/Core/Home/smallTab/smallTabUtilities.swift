//
//  smallTabUtilities.swift
//  Moove-it
//
//  Created by Ang KS on 24/5/24.
//

import SwiftUI

struct smallTabUtilities: View {
        
    var tabs_array = [
        TabData(icon: "map.fill", text: "MRT Map", color: Color.blue, disabled: false),
        TabData(icon: "exclamationmark.triangle.fill", text: "Updates", color: Color.orange, disabled: false),
        TabData(icon: "ticket.fill", text: "Tickets", color: Color.green, disabled: true),
        TabData(icon: "car.fill", text: "Something", color: Color.green, disabled: true)
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .center, spacing: 10){
                    ForEach(tabs_array, id: \.self.text){ tab in
                        Tabs(icon: tab.icon, text: tab.text, color: tab.color, disabled: tab.disabled)
                        
                    }
                    Spacer()
                    
                }
                .padding(.horizontal, 2)
                .padding(.vertical, 3)
            }
            
        }
    }
}

struct TabData {
    let icon: String
    let text: String
    let color: Color
    let disabled: Bool
}



#Preview {
    smallTabUtilities()
}
