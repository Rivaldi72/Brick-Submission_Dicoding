//
//  CardShimmer.swift
//  Brick
//
//  Created by Rivaldi Aliando on 01/12/20.
//

import SwiftUI

struct CardShimmer: View {
  @State var show = true
  var center = (UIScreen.main.bounds.width / 2) + 110
  
  var body: some View {
    
    HStack(alignment: .center, spacing: 5){
      
      VStack(alignment: .leading, spacing: 5){
        ZStack(alignment: .leading){
          
          Color.black.opacity(0.15)
            .frame(width: 60.0, height:60)
            .clipShape(Circle())
          
          Color.white
            .frame(height: 100)
            .mask(
              
              Rectangle()
                .fill(
                  
                  LinearGradient(gradient: .init(colors: [.clear,Color.white.opacity(0.48),.clear]), startPoint: .top, endPoint: .bottom)
                )
                .rotationEffect(.init(degrees: -70))
                .offset(x: self.show ? center : -center)
              
            )
        }
        .onAppear {
          
          withAnimation(Animation.default.speed(0.15).delay(0).repeatForever(autoreverses: false)){
            
            self.show.toggle()
          }
        }
        
        
      }
      .padding(.leading, -90)
      .frame(width: 30, height: 80)
      
      VStack(alignment: .leading, spacing: 5){
        
        ZStack(alignment: .leading){
          
          Color.black.opacity(0.15)
            .frame(width: 150.0, height:10)
          
          Color.white
            .frame(height: 15)
            .mask(
              
              Rectangle()
                .fill(
                  
                  LinearGradient(gradient: .init(colors: [.clear,Color.white.opacity(0.48),.clear]), startPoint: .top, endPoint: .bottom)
                )
                .rotationEffect(.init(degrees: -70))
                .offset(x: self.show ? center : -center)
              
            )
        }
        .onAppear {
          
          withAnimation(Animation.default.speed(0.2).delay(0).repeatForever(autoreverses: false)){
            
            self.show.toggle()
          }
        }
        
        ZStack(alignment: .leading){
          
          Color.black.opacity(0.15)
            .frame(width: 110.0, height:10)
          
          Color.white
            .frame(height: 15)
            .mask(
              
              Rectangle()
                .fill(
                  
                  LinearGradient(gradient: .init(colors: [.clear,Color.white.opacity(0.48),.clear]), startPoint: .top, endPoint: .bottom)
                )
                .rotationEffect(.init(degrees: -70))
                .offset(x: self.show ? center : -center)
              
            )
        }
        .onAppear {
          
          withAnimation(Animation.default.speed(0.2).delay(0).repeatForever(autoreverses: false)){
            
            self.show.toggle()
          }
        }
        
        ZStack(alignment: .leading){
          
          Color.black.opacity(0.15)
            .frame(width: 70.0, height:10)
          
          Color.white
            .frame(height: 15)
            .mask(
              
              Rectangle()
                .fill(
                  
                  LinearGradient(gradient: .init(colors: [.clear,Color.white.opacity(0.48),.clear]), startPoint: .top, endPoint: .bottom)
                )
                .rotationEffect(.init(degrees: -70))
                .offset(x: self.show ? center : -center)
              
            )
        }
        .onAppear {
          
          withAnimation(Animation.default.speed(0.2).delay(0).repeatForever(autoreverses: false)){
            
            self.show.toggle()
          }
        }
      }
      .frame(width: 80, height: 80)
      
    }
    .frame(width: UIScreen.main.bounds.size.width - 70)
    .padding(.horizontal)
    .padding(.vertical, 8)
    .background(Color.white)
    .cornerRadius(15)
    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
  }}

struct CardShimmer_Previews: PreviewProvider {
  static var previews: some View {
    CardShimmer()
  }
}
