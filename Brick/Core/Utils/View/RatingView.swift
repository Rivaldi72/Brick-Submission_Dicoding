//
//  RatingView.swift
//  Brick
//
//  Created by Rivaldi Aliando on 05/12/20.
//

import SwiftUI

struct RatingView: View {
  
  var allGames: GameModel
  
  var body: some View {
    
    HStack(alignment: .center, spacing: 5){
      
      if allGames.rating >= 4.8 {
        ForEach(1...5,id: \.self){_ in
          
          Image(systemName: "star.fill")
            .resizable()
            .frame(width: 13, height: 13)
            .foregroundColor(.yellow)
        }
      }
      else if allGames.rating >= 4.3 {
        ForEach(1...4,id: \.self){_ in
          
          Image(systemName: "star.fill")
            .resizable()
            .frame(width: 13, height: 13)
            .foregroundColor(.yellow)
        }
        
        Image(systemName: "star.lefthalf.fill")
          .resizable()
          .frame(width: 13, height: 13)
          .foregroundColor(.yellow)
      }
      else if allGames.rating >= 4 {
        ForEach(1...4,id: \.self){_ in
          
          Image(systemName: "star.fill")
            .resizable()
            .frame(width: 13, height: 13)
            .foregroundColor(.yellow)
        }
        
        Image(systemName: "star.fill")
          .resizable()
          .frame(width: 13, height: 13)
          .foregroundColor(Color("inactive_star"))
      }
      else if allGames.rating >= 3.8 {
        ForEach(1...4,id: \.self){_ in
          
          Image(systemName: "star.fill")
            .resizable()
            .frame(width: 13, height: 13)
            .foregroundColor(.yellow)
        }
      }
      else if allGames.rating >= 3.3 {
        ForEach(1...3,id: \.self){_ in
          
          Image(systemName: "star.fill")
            .resizable()
            .frame(width: 13, height: 13)
            .foregroundColor(.yellow)
        }
        
        Image(systemName: "star.lefthalf.fill")
          .resizable()
          .frame(width: 13, height: 13)
          .foregroundColor(.yellow)
        
        Image(systemName: "star.fill")
          .resizable()
          .frame(width: 13, height: 13)
          .foregroundColor(Color("inactive_star"))
      }
      else if allGames.rating >= 3 {
        ForEach(1...3,id: \.self){_ in
          
          Image(systemName: "star.fill")
            .resizable()
            .frame(width: 13, height: 13)
            .foregroundColor(.yellow)
        }
        
        Image(systemName: "star.fill")
          .resizable()
          .frame(width: 13, height: 13)
          .foregroundColor(Color("inactive_star"))
        
        Image(systemName: "star.fill")
          .resizable()
          .frame(width: 13, height: 13)
          .foregroundColor(Color("inactive_star"))
      }
      else if allGames.rating >= 2.8 {
        ForEach(1...3,id: \.self){_ in
          
          Image(systemName: "star.fill")
            .resizable()
            .frame(width: 13, height: 13)
            .foregroundColor(.yellow)
        }
      }
      else if allGames.rating >= 2.3 {
        ForEach(1...2,id: \.self){_ in
          
          Image(systemName: "star.fill")
            .resizable()
            .frame(width: 13, height: 13)
            .foregroundColor(.yellow)
        }
        
        Image(systemName: "star.lefthalf.fill")
          .resizable()
          .frame(width: 13, height: 13)
          .foregroundColor(.yellow)
        
        Image(systemName: "star.fill")
          .resizable()
          .frame(width: 13, height: 13)
          .foregroundColor(Color("inactive_star"))
        
        Image(systemName: "star.fill")
          .resizable()
          .frame(width: 13, height: 13)
          .foregroundColor(Color("inactive_star"))
      }
      else if allGames.rating >= 2 {
        ForEach(1...2,id: \.self){_ in
          
          Image(systemName: "star.fill")
            .resizable()
            .frame(width: 13, height: 13)
            .foregroundColor(.yellow)
        }
        
        Image(systemName: "star.fill")
          .resizable()
          .frame(width: 13, height: 13)
          .foregroundColor(Color("inactive_star"))
        
        Image(systemName: "star.fill")
          .resizable()
          .frame(width: 13, height: 13)
          .foregroundColor(Color("inactive_star"))
        
        Image(systemName: "star.fill")
          .resizable()
          .frame(width: 13, height: 13)
          .foregroundColor(Color("inactive_star"))
      }
      else if allGames.rating >= 1.8 {
        ForEach(1...2,id: \.self){_ in
          
          Image(systemName: "star.fill")
            .resizable()
            .frame(width: 13, height: 13)
            .foregroundColor(.yellow)
        }
      }
      else if allGames.rating >= 1.3 {
        ForEach(1...2,id: \.self){_ in
          
          Image(systemName: "star.fill")
            .resizable()
            .frame(width: 13, height: 13)
            .foregroundColor(.yellow)
        }
        
        Image(systemName: "star.lefthalf.fill")
          .resizable()
          .frame(width: 13, height: 13)
          .foregroundColor(.yellow)
        
        Image(systemName: "star.fill")
          .resizable()
          .frame(width: 13, height: 13)
          .foregroundColor(Color("inactive_star"))
        
        Image(systemName: "star.fill")
          .resizable()
          .frame(width: 13, height: 13)
          .foregroundColor(Color("inactive_star"))
        
        Image(systemName: "star.fill")
          .resizable()
          .frame(width: 13, height: 13)
          .foregroundColor(Color("inactive_star"))
      }
      else {
        Image(systemName: "star.fill")
          .resizable()
          .frame(width: 13, height: 13)
          .foregroundColor(.yellow)
      }
    }
    
    Text(String(format: "%.1f", allGames.rating))
      .font(.custom("Oswald-DemiBold", size: 13))
      .foregroundColor(Color("dark_gray_color"))
  }
}
