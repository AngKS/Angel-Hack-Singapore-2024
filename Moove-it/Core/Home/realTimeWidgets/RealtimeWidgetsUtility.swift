//
//  RealtimeWidgetsUtility.swift
//  Moove-it
//
//  Created by Ang KS on 24/5/24.
//

import SwiftUI

struct RealtimeWidgetsUtility: View {
    var body: some View {
        ScrollView{
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .center, spacing: 10){
                    ForEach(0 ... 3, id: \.self){ widget in
                       realTimeWidget()
                    }
                    Spacer()
                    
                }
                .padding(.horizontal, 2)
                .padding(.vertical, 3)
            }
        }
    }
}

struct UtilityWidget{
    let lineName: String
    let lineColor: Color
    let directionDest: String
    
}

#Preview {
    RealtimeWidgetsUtility()
}
