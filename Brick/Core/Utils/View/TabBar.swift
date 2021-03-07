//
//  TabBar.swift
//  Brick
//
//  Created by Rivaldi Aliando on 06/12/20.
//

import SwiftUI
import Common

struct TabBar: View {
    
    @State var index = 1
    
    @State var height = UIScreen.main.bounds.height
    
    @State var isSearch = false
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
            
            HStack(alignment: .center){
                
                Button(action: {
                   
                }) {
                    VStack(alignment: .center, spacing: 3){
                        
                        Image(uiImage: CommonImage(named: index == 1 ? "home_active" : "home_inactive")!)
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
            
            Button(action: {
                isSearch = true
            }) {
                Image(uiImage: CommonImage(named: "nav_search")!)
                    .resizable()
                    .frame(width: height >= 668 ? 95 : 85, height: height >= 668 ? 100 : 90)
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3)
            }.padding(.top, height >= 668 ? -45 : -41)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
