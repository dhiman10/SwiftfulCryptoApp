//
//  CircleButton Animation.swift
//  SwiftfulCryptoG
//
//  Created by Dhiman Das on 13.09.24.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 10.0) : .none , value: animate)
            .onAppear {
                animate.toggle()
            }
      

    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
        .foregroundColor(.red)
         .frame(width: 100, height: 100)
}
