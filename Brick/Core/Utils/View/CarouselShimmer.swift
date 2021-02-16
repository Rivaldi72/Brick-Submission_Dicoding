//
//  CarouselShimmer.swift
//  Brick
//
//  Created by Rivaldi Aliando on 05/12/20.
//

import SwiftUI

struct CarouselShimmer : View {
  
  @State var show = false
  @State var widthShape = UIScreen.main.bounds.width / 1.7
  @State var heightShape = UIScreen.main.bounds.height / 2.5
  
  var center = (UIScreen.main.bounds.width / 2) + 110
  
  var body : some View{
    
    ZStack{
      
      Color.white
        .frame(height: heightShape)
        .cornerRadius(10)
      
      Color.black.opacity(0.09)
        .frame(height: heightShape)
        .cornerRadius(10)
      
      Color.white
        .frame(height: heightShape)
        .cornerRadius(10)
        .mask(
          
          Rectangle()
            .fill(
              
              LinearGradient(gradient: .init(colors: [.clear,Color.white.opacity(0.5),.clear]), startPoint: .top, endPoint: .bottom)
            )
            .rotationEffect(.init(degrees: -80))
            .offset(x: self.show ? center : -center)
          
        )
    }
    .padding(.horizontal, 60)
    .padding(.top, 5)
    .padding(.bottom, 10)
    .onAppear {
      
      withAnimation(Animation.default.speed(0.3).delay(1).repeatForever(autoreverses: false)){
        
        self.show.toggle()
      }
    }
  }
}

struct CarouselShimmer_Previews: PreviewProvider {
  static var previews: some View {
    CarouselShimmer()
  }
}
