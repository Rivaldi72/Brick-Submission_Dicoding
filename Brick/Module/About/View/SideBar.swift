//
//  SideBar.swift
//  Brick
//
//  Created by Rivaldi Aliando on 03/01/21.
//

import SwiftUI
import Common

struct SideBar: View {
    
    @Binding var profileShow: Bool

    var body: some View {
        HStack{
            
            VStack(spacing: 15){
                
                VStack(spacing: 15) {
                    
                    Image(uiImage: CommonImage(named: "me")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(.top, 30)
                        .clipShape(Circle())
                        .frame(width: 80, height: 80)
                        .padding(.top, 60)
                    
                    VStack(spacing: 0){
                        
                        Text("Rivaldi Aliando")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                        
                        Text("iOS Developer")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Text("PT. Bursaku Teknologi Financial ( Bursaku.id )")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                            .font(.caption2)
                            .padding(.horizontal)
                    }
                }
                Divider()
                
                HStack(alignment: .center, spacing: 10, content: {
                    
                    Button(action: {
                        
                    }, label: {
                        
                        ZStack(alignment: .center){
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                                .frame(width: 50, height: 50)
                            Image(uiImage: CommonImage(named: "whatsapp")!)
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        
                        ZStack(alignment: .center){
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                                .frame(width: 50, height: 50)
                            Image(uiImage: CommonImage(named: "instagram")!)
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        
                        ZStack(alignment: .center){
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                                .frame(width: 50, height: 50)
                            Image(uiImage: CommonImage(named: "linkedin")!)
                                .resizable()
                                .frame(width: 25, height: 25)
                        }
                    })
                    
                })
                .padding()
                
                Divider()
                
                VStack(alignment: .leading, spacing: 10, content: {
                    
                    HStack(alignment: .center, content: {
                        
                        Link("Linkedin", destination: URL(string: "https://www.linkedin.com/in/rivaldialiando7")!)
                            .foregroundColor(Color("red_color"))
                        
                        Spacer()
                    })
                    
                    HStack(alignment: .center, content: {
                        
                        Link("Instagram", destination: URL(string: "https://www.instagram.com/rivaldialiando7")!)
                            .foregroundColor(Color("red_color"))
                        
                        Spacer()
                    })
                    
                    HStack(alignment: .center, content: {
                        
                        Link("Whatsapp", destination: URL(string: "https://wa.me/6285658069092")!)
                            .foregroundColor(Color("red_color"))
                        
                        Spacer()
                    })
                    
                }).padding(.horizontal)
                
                Spacer(minLength: 0)
                
                Divider()
                
                HStack(alignment: .center, spacing: 10, content: {
                    
                    Text("Versi 1.0.0.2")
                        .font(.caption)
                })
                .padding(.bottom)
                .padding(.horizontal)
            }
            .frame(width: UIScreen.main.bounds.width / 1.5)
            .background(
                Image(uiImage: CommonImage(named: "bg_home_transparent")!)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width / 1.5)
            )
            .background(Color.white).edgesIgnoringSafeArea(.all)
            
            Spacer(minLength: 0)
        }
        .offset(x: self.profileShow ? 0 : -UIScreen.main.bounds.width)
        .background(
            Color.black.opacity(self.profileShow ? 0.28 : 0)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    
                    withAnimation{
                        self.profileShow.toggle()
                    }
                })
    }
}
