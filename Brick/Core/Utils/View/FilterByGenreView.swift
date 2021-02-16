//
//  FilterByGenreView.swift
//  Brick
//
//  Created by Rivaldi Aliando on 05/12/20.
//

import SwiftUI

struct FilterByGenreView: View {
  
  @State var index = 1
  
  var body: some View {
    
    HStack(alignment: .center) {
      
      Button(action: {
        index = 1
      }) {
        VStack(alignment: .center, spacing: 5) {
          
          Image(index == 1 ? "all_active" : "all_inactive")
            .resizable()
            .frame(width: 50, height: 50)
          
          Text("All")
            .font(.custom("Poppins-Light", size: 12))
            .foregroundColor(.black)
        }
      }
      
      Spacer()
      
      Button(action: {
        index = 2
      }) {
        VStack(alignment: .center, spacing: 5) {
          
          Image(index == 2 ? "action_active" : "action_inactive")
            .resizable()
            .frame(width: 50, height: 50)
          
          Text("Action")
            .font(.custom("Poppins-Light", size: 12))
            .foregroundColor(.black)
        }
      }
      
      Spacer()
      
      Button(action: {
        index = 3
      }) {
        VStack(alignment: .center, spacing: 5) {
          
          Image(index == 3 ? "arcade_active" : "arcade_inactive")
            .resizable()
            .frame(width: 50, height: 50)
          
          Text("Arcade")
            .font(.custom("Poppins-Light", size: 12))
            .foregroundColor(.black)
        }
      }
      
      Spacer()
      
      Button(action: {
        index = 4
      }) {
        VStack(alignment: .center, spacing: 5) {
          
          Image(index == 4 ? "adventure_active" : "adventure_inactive")
            .resizable()
            .frame(width: 50, height: 50)
          
          Text("Adventure")
            .font(.custom("Poppins-Light", size: 12))
            .foregroundColor(.black)
        }
      }
      
      Spacer()
      
      Button(action: {
        
      }) {
        VStack(alignment: .center, spacing: 5) {
          
          Image("more_inactive")
            .resizable()
            .frame(width: 50, height: 50)
          
          Text("More")
            .font(.custom("Poppins-Light", size: 12))
            .foregroundColor(.black)
        }
      }
    }
  }
}

struct FilterByGenreView_Previews: PreviewProvider {
  static var previews: some View {
    FilterByGenreView()
  }
}
