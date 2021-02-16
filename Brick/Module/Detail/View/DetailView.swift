//
//  DetailView.swift
//  Brick
//
//  Created by Rivaldi Aliando on 29/11/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
  @ObservedObject var presenter: DetailPresenter
  
  @State var isFavorite = false
  
  var body: some View {
    ZStack {
      if presenter.loadingState {
        loadingIndicator
      } else {
        
        ScrollView(.vertical, showsIndicators: false, content: {
          
          ZStack(alignment: .bottom){
            
            GeometryReader{reader in
              
              WebImage(url: URL(string: self.presenter.game.backgroundImage ))
                .resizable()
                .aspectRatio(contentMode: .fill)
                
                .offset(y: -reader.frame(in: .global).minY)
                
                .frame(width: UIScreen.main.bounds.width, height:  reader.frame(in: .global).minY + 480)
              
              Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
                
                .offset(y: -reader.frame(in: .global).minY)
                
                .frame(width: UIScreen.main.bounds.width, height:  reader.frame(in: .global).minY + 480)
              
            }.frame(height: 480)
            
            Text(self.presenter.game.name)
              .font(.system(size: 30, weight: .black))
              .foregroundColor(.white)
              .multilineTextAlignment(.leading)
              .padding(.top, -150)

          }
          
          ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
            
            VStack(alignment: .leading, spacing: 15){
              
              HStack(spacing: 10){
                
                GenreView(logo: "simulation", genre: "Adventure")
                
                Spacer()
                
                Text("Developer : Rivaldi Aliando")
                  .font(.custom("Poppins-Medium", size: 12))
                  .foregroundColor(Color("dark_gray_color"))
                
              }
              .padding(.top, 20)
              
              HStack(spacing: 15){
                
                RatingView(allGames: self.presenter.game)
                
              }
              
              Text("Some Scene May Scare Very Young Childrens")
                .font(.caption)
                .foregroundColor(.black)
                .padding(.top,5)
              
              Text(plot)
                .padding(.top, 10)
                .foregroundColor(.black)
              
            }
            .padding(.top, 25)
            .padding(.horizontal)
            .padding(.horizontal)
            .background(Color.white)
            .cornerRadius(30)
            .offset(y: -60)
            
            Button(action: {
                self.presenter.addToFavorite(game: self.presenter.game)
                self.isFavorite.toggle()
            }) {
              ZStack{
                Circle()
                  .frame(width: 55, height: 55)
                  .foregroundColor(Color.white)
                  .shadow(radius: 10)
                Image(systemName: "heart.fill")
                  .resizable()
                  .frame(width: 20, height: 20)
                    .foregroundColor(self.isFavorite ? Color("red_color") : Color.gray)
              }
            }.padding(.top, -85)
            .padding(.trailing, 30)
          }
          
        })
        .edgesIgnoringSafeArea(.all)
        .background(Color.white.edgesIgnoringSafeArea(.all))
      }
    }.onAppear{
        self.isFavorite = self.presenter.game.isFavorite
    }
  }
}

extension DetailView {
  var spacer: some View {
    Spacer()
  }
  
  var loadingIndicator: some View {
    VStack {
      Text("Loading...")
      ActivityIndicator()
    }
  }
}


var plot = "Nine years earlier, following the events of Toy Story 2, Bo Peep and Woody attempt to rescue RC, Andy's remote-controlled car, from a rainstorm. Just as they finish the rescue, Woody watches as Bo is donated to a new owner, and considers going with her, but ultimately decides to remain with Andy. Years later, a young adult Andy donates them to Bonnie, a younger child, before he goes off to college. While the toys are grateful to have a new child, Woody struggles to adapt to an environment where he is not the favorite as he was with Andy, apparent when Bonnie takes Woody's sheriff badge and puts it on Jessie instead, not even bothering to give him a role during her playtime.On the day of Bonnie's kindergarten orientation, Woody worries over her and sneaks into her backpack. After a classmate takes away Bonnie's arts and crafts supplies, Woody covertly recovers the materials and various pieces of garbage from the trash, including a plastic spork. Bonnie uses these to create a bipedal spork with googly eyes, whom she dubs Forky. Forky comes to life in Bonnie's backpack and begins to experience an existential crisis, thinking he is garbage rather than a toy and wishing to remain in a trash can. As Forky becomes Bonnie's favorite toy, Woody takes it upon himself to prevent Forky from throwing himself away......."
