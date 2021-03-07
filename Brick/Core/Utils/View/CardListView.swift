//
//  CardListView.swift
//  Brick
//
//  Created by Rivaldi Aliando on 04/12/20.
//

import SwiftUI
import SDWebImageSwiftUI
import RealmSwift
import Common
import Core
import Game

struct CardListView: View {
    
    let allGames: GameDomainModel
    var presenter: FavoritePresenter<Int, Bool, Interactor<Int, Bool, UpdateFavoriteGameRepository<GetAllGamesLocale, DetailGameTransformer>>>
    var body: some View {
        
        HStack(alignment: .center, spacing: 13){
            
            HStack(alignment: .center, content: {
                
                HStack{
                    WebImage(url: URL(string: allGames.backgroundImage))
                        .resizable()
                        .indicator(.activity)
                        .transition(.fade(duration: 0.5))
                        .frame(width: 120, height: 90)
                        .padding(.leading, -UIScreen.main.bounds.size.width / 7)
                }
                
                HStack{
                    VStack(alignment: .leading, spacing: 3, content: {
                        
                        HStack(alignment: .center){
                            
                            VStack(alignment: .leading, content: {
                                
                                Text(allGames.name)
                                    .frame(alignment: .leading)
                                    .multilineTextAlignment(.leading)
                                    .font(.custom("Oswald-DemiBold", size: 16))
                            }).frame(width: UIScreen.main.bounds.width - 200, alignment: .leading)
                            
                            VStack(alignment: .trailing, content: {
                                
                                Button(action: {
                                    presenter.addToFavorite(request: allGames.id)
                                }) {
                                    Image(uiImage: CommonImage(named: self.allGames.isFavorite ? "love_active" : "love_inactive")!)
                                        .resizable()
                                        .frame(width: 18, height: 18, alignment: .trailing)
                                }
                            }).frame(width: UIScreen.main.bounds.width / 10, alignment: .trailing)
                            
                        }.frame(width: UIScreen.main.bounds.width - 150, alignment: .leading)
                        
                        HStack(alignment: .center){
                            
                            RatingView(allGames: allGames)
                            
                        }.frame(width: UIScreen.main.bounds.width - 150, alignment: .leading)
                        
                        HStack(alignment: .center){
                            
                            HStack(alignment: .center){
                                Image(uiImage: CommonImage(named: "pc")!)
                                    .resizable()
                                    .frame(width: 12, height: 12)
                            }
                            
                            Spacer()
                            
                            GenreView(logo: "simulation", genre: "Adventure")
                            
                        }.frame(width: UIScreen.main.bounds.width - 150, alignment: .leading)
                        
                    }).frame(width: UIScreen.main.bounds.width - 150, alignment: .leading)
                    .padding(.vertical, 11)
                    
                    HStack{
                        
                        
                    }
                }
            })
            .frame(width: UIScreen.main.bounds.size.width - 50)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
        }
        .onAppear{
            
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}
