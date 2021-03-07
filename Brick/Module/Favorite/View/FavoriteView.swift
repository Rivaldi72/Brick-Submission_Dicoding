//
//  FavoriteView.swift
//  Brick
//
//  Created by Rivaldi Aliando on 05/12/20.
//

import SwiftUI
import SDWebImageSwiftUI
import Common
import Game
import Core

struct FavoriteView : View {
    
    @ObservedObject var presenter: GetListPresenter<Any, GameDomainModel, Interactor<Any, [GameDomainModel], GetFavoriteGamesRepository<GetFavoriteGamesLocale,  AllGameTransformer>>>
    //    @State var index = 0
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    @State var hasTimeElapsed = false
    
    init(presenter: GetListPresenter<Any, GameDomainModel, Interactor<Any, [GameDomainModel], GetFavoriteGamesRepository<GetFavoriteGamesLocale,  AllGameTransformer>>>) {
        self.presenter = presenter
    }
    
    var body: some View{
        
        ScrollView(.vertical, showsIndicators: false) {
            
            if (!hasTimeElapsed) {
                
                VStack(alignment: .center, spacing: 0, content: {
                    LoadingComponent().frame(height: UIScreen.main.bounds.height / 1.5)
                })
            } else {
                
                if self.presenter.list.count != 0 {
                    LazyVStack{
                        LazyVGrid(columns: self.columns,spacing: 25){
                            
                            ForEach(self.presenter.list){game in
                                
                                GridView(game: game, presenter: self.presenter)
                            }
                            
                        }
                        .padding([.horizontal,.top])
                        
                    }
                    .padding(.vertical)
                } else {
                    Text("Belum ada game favorit")
                }
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                hasTimeElapsed = true
            }
            self.presenter.getList(request: nil)
        }
        .background(
            Image(uiImage: CommonImage(named: "bg_home_transparent")!)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
        .navigationBarTitle("Favorite")
    }
}

struct GridView : View {
    
    var game: GameDomainModel
    var presenter: GetListPresenter<Any, GameDomainModel, Interactor<Any, [GameDomainModel], GetFavoriteGamesRepository<GetFavoriteGamesLocale,  AllGameTransformer>>>
    @Namespace var namespace
    
    var body: some View{
        
        
        VStack{
            
            
            VStack(spacing: 15){
                
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                    
                    WebImage(url: URL(string: game.backgroundImage))
                        .resizable()
                        .indicator(.activity)
                        .aspectRatio(contentMode: .fit)
                        .transition(.fade(duration: 0.5))
                    //                        .frame(width: 100, height: 300)
                    
                    Button {
                        
                    } label: {
                        
                        Image(systemName: "heart.fill")
                            .foregroundColor(self.game.isFavorite ? Color("red_color") : Color.gray )
                            .padding(.all,10)
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                    .padding(.all,10)
                    
                }
                
                Text(game.name)
                    .fontWeight(.bold)
                    .lineLimit(1)
                
                self.linkDetailBuilder(for: game) {
                    Text("Detail")
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .padding(.horizontal,25)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                
                //                NavigationLink(destination: FavoriteDetailView(favoriteGame: game)){
                //                    Text("Detail")
                //                        .foregroundColor(.white)
                //                        .padding(.vertical,10)
                //                        .padding(.horizontal,25)
                //                        .background(Color.red)
                //                        .cornerRadius(10)
                //
                //                }
            }
            
        }
    }
    func linkDetailBuilder<Content: View>(
        for allGames: GameDomainModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        
        NavigationLink(
            destination: HomeRouter().makeDetailView(for: allGames.id)
        ) { content() }
    }
}
