//
//  LoadingComponent.swift
//  Brick
//
//  Created by Bursaku Macbook Air 1 on 05/01/21.
//

import SwiftUI

struct LoadingComponent: View {
    
    @State private var shouldAnimate = false
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center, spacing: shouldAnimate ? 15 : -15) {
                Circle()
                    .fill(Color("red_color"))
                    .frame(width: shouldAnimate ? 10 : 15)
                Circle()
                    .fill(Color("red_color"))
                    .frame(width: shouldAnimate ? 10 : 15)
                Circle()
                    .fill(Color("red_color"))
                    .frame(width: shouldAnimate ? 10 : 15)
            }
            .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true))
            .onAppear {
                self.shouldAnimate = true
            }
        }.frame(width: UIScreen.main.bounds.width)
    }
}

struct LoadingComponent_Previews: PreviewProvider {
    static var previews: some View {
        LoadingComponent()
    }
}
