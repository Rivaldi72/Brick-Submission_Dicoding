//
//  GenreView.swift
//  Brick
//
//  Created by Rivaldi Aliando on 05/12/20.
//

import SwiftUI

struct GenreView: View {
  
  var logo: String
  var genre: String
  
  var body: some View {
    HStack(alignment: .center, spacing: 3){
      
      Image(logo)
        .resizable()
        .frame(width: 10, height: 10)
      
      Text(genre)
        .font(.custom("Poppins-Light", size: 10))
    }
    .padding(.horizontal, 5)
    .padding(.vertical, 3)
    .background(Color.white)
    .cornerRadius(3)
    .shadow(color: Color.black.opacity(0.1), radius: 2)
  }
}

struct GenreView_Previews: PreviewProvider {
  static var previews: some View {
    GenreView(logo: "simulation", genre: "Simulation")
  }
}
