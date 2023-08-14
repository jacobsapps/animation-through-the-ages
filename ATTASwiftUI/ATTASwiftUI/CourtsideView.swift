//
//  CourtsideView.swift
//  ATTASwiftUI
//
//  Created by Jacob Bartlett on 12/08/2023.
//

import SwiftUI

struct CourtsideView: View {
    
    @Namespace private var animation
    @State private var isFirstHalf: Bool = true
    
    var body: some View {
        VStack {
            halfTimeButton
            HStack {
                if isFirstHalf {
                    team(name: "Red Team", color: .red, flipped: false)
                    Spacer()
                    team(name: "Green Team", color: .green, flipped: true)
                } else {
                    team(name: "Green Team", color: .green, flipped: false)
                    Spacer()
                    team(name: "Red Team", color: .red, flipped: true)
                }
            }
            .background { courtBackground }
            .frame(height: 200)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.indigo)
    }
    
    private var courtBackground: some View {
        Image(systemName: "sportscourt")
            .resizable()
            .scaledToFit()
            .frame(height: 200)
            .foregroundColor(.white.opacity(0.2))
    }
    
    private var halfTimeButton: some View {
        Button(action: {
            withAnimation(.spring()) {
                isFirstHalf.toggle()
            }
            
        }, label: {
            Label("Half Time", systemImage: "flag.filled.and.flag.crossed")
        })
    }
    
    private func team(name: String, color: Color, flipped: Bool) -> some View {
        Text(name)
            .foregroundColor(color)
            .font(.title)
            .fontWeight(.bold)
            .rotationEffect(.radians(flipped ? (.pi / 2) : (-.pi / 2)))
            .matchedGeometryEffect(id: name, in: animation)
    }
}

#Preview {
    CourtsideView()
}
