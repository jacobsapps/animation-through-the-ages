//
//  DumbbellView.swift
//  ATTASwiftUI
//
//  Created by Jacob Bartlett on 11/08/2023.
//

import SwiftUI

struct DumbbellView: View {
    
    enum Rep {
        case left
        case right
        
        mutating func lift() {
            switch self {
            case .left: self = .right
            case .right: self = .left
            }
        }
        
        func scale(rep: Rep) -> Double {
            self == rep ? 4 : 1
        }

        func alignment(rep: Rep) -> Alignment {
            self == rep ? .top : .bottom
        }
    }
    
    @State var rep: Rep?
    
    var body: some View {
        HStack {
            dumbell(side: .left)
            dumbell(side: .right)
        }
        .padding()
        .background(Color.indigo)
        .onAppear {
            if rep == nil {
                rep = .left
                rep?.lift()
            }
        }
    }
            
    private func dumbell(side: Rep) -> some View {
        Image(systemName: "dumbbell.fill")
            .foregroundColor(.white)
            .imageScale(.large)
            .foregroundColor(.accentColor)
            .scaleEffect(side.scale(rep: rep ?? .left))
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: side.alignment(rep: rep ?? .left))
            .animation(loopingAnimation, value: rep)
    }
    
    private var loopingAnimation: Animation {
        .easeInOut(duration: 0.75)
        .repeatForever(autoreverses: true)
    }
}

struct DumbbellView_Previews: PreviewProvider {
    static var previews: some View {
        DumbbellView()
    }
}
