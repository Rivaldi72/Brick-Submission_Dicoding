//
//  HomeView.swift
//  Brick
//
//  Created by Rivaldi Aliando on 29/11/20.
//

import SwiftUI
import RealmSwift

struct HomeView: View {
  
  @ObservedObject var presenter: HomePresenter
  
  @State var index = 1
  
  @State var height = UIScreen.main.bounds.height
  
  @State var isSearch = false
  
  @State var profileShow = false
  
  var body: some View {
    
    ZStack(alignment: .bottom){
      
      ScrollView(.vertical, showsIndicators: false) {
        
        Text("Have you played games today?")
          .font(.custom("Street Photography", size: height >= 667 ? 28 : 25))
          .padding(.top, -50)
        
        if presenter.loadingState {
          CarouselShimmer()
        } else {
          CarouselView(data: self.$presenter.latestGames)
            .padding(.top, -10)
        }
        
        HStack(alignment: .center, content: {
          FilterByGenreView()
        }).padding(.horizontal, 23)
        
        if presenter.loadingState {
          ScrollView(.vertical, showsIndicators: false) {
            ForEach(1...5,id: \.self){_ in
              CardShimmer()
                .padding(8)
            }
          }
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            ForEach(
              self.presenter.allGames,
              id: \.id
            ) { allGame in
              self.presenter.linkBuilder(for: allGame) {
                CardListView(allGames: allGame, presenter: self.presenter)
              }.buttonStyle(PlainButtonStyle())
              .padding(.vertical, 8)
            }
          }.padding(.bottom, 100)
        }
      }
      
      ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
        
        HStack(alignment: .center){
          
          Button(action: {
            
          }) {
            VStack(alignment: .center, spacing: 3){
              
              Image(index == 1 ? "home_active" : "home_inactive")
                .resizable()
                .frame(width: height >= 668 ? 35 : 25, height: height >= 668 ? 35 : 25)
                .foregroundColor(Color("gray_color"))
              
              Text("Home")
                .font(.custom("Poppins-Light", size: height >= 668 ? 15 : 10))
                .foregroundColor(index == 1 ? Color("red_color") : Color.black)
            }
          }
          
          Spacer()
          
          Button(action: {
            
          }) {
            VStack(alignment: .center, spacing: 3){
              
              Image(index == 3 ? "setting_active" : "setting_inactive")
                .resizable()
                .frame(width: height >= 668 ? 35 : 25, height: height >= 668 ? 35 : 25)
                .foregroundColor(Color("gray_color"))
              
              Text("Setting")
                .font(.custom("Poppins-Light", size: height >= 668 ? 15 : 10))
                .foregroundColor(index == 3 ? Color("red_color") : Color.black)
            }
          }
        }
        .padding(.horizontal, 50)
        .padding(.vertical, 10)
        .background(RoundedCorners(color: .init("white_color"), tl: 40, tr: 40, bl: 0, br: 0))
        .shadow(color: Color.black.opacity(0.3), radius: 20)
        
        self.presenter.linkSearchBuilder(){
          Image("nav_search")
            .resizable()
            .frame(width: height >= 668 ? 95 : 85, height: height >= 668 ? 100 : 90)
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3)
        }.padding(.top, height >= 668 ? -45 : -41)
      }
      
      SideBar(profileShow: self.$profileShow)
    }
    .navigationBarItems(
      leading:
        HStack {
          Button(action: {
            withAnimation{
              self.profileShow.toggle()
            }
          }) {
            Image(systemName: "person.circle.fill")
              .resizable()
              .frame(width: 30, height: 30)
              .foregroundColor(Color("gray_color"))
          }.padding(.leading, 3)
        },
      trailing:
        HStack {
          self.presenter.linkFavoriteBuilder() {
            Image("love_active")
              .resizable()
              .frame(width: 28, height: 28)
              .padding(.trailing, 7)
          }.buttonStyle(PlainButtonStyle())
        }
    )
    .onAppear {
        self.presenter.getLatestGames()
        self.presenter.getAllGames()
    }
    .background(
      Image("bg_home_transparent")
        .resizable()
        .edgesIgnoringSafeArea(.all)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    )
    .edgesIgnoringSafeArea(.bottom)
  }
}
