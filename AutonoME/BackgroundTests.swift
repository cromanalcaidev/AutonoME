//
//  BackgroundTests.swift
//  AutonoME
//
//  Created by Carlos Román Alcaide on 13/4/24.
//

import SwiftUI

struct BackgroundTests: View {
    
//    let gradientColors: Color = [[Color.purple, Color.orange],
//                        [Color.purple, Color.blue],
//    ]
    
    // night time = [.indigo, .blue], [.indigo, .purple],
    // day time = [.cyan, .mint], [.mint, .teal], [.green, .cyan]
    
    
    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [.purple, .orange]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                )
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundTests()
}
