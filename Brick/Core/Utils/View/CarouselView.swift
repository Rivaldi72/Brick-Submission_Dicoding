//
//  CarouselView.swift
//  Brick
//
//  Created by Rivaldi Aliando on 01/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct CarouselView: View {
    
    @State var x : CGFloat = 0
    @State var count : CGFloat = 0
    @State var screen = UIScreen.main.bounds.width / 1.7
    @State var op : CGFloat = 0
    
    @Binding var data : [GameModel]
    
    var body : some View{
        ScrollView{
            
            VStack{
                
                Spacer()
                
                HStack(spacing: 15){
                    
                    ForEach(data){i in
                        
                        CardView(data: i)
                            .offset(x: self.x)
                            .highPriorityGesture(DragGesture()
                                                    .onChanged({ (value) in
                                                        
                                                        if value.translation.width > 0{
                                                            
                                                            self.x = value.location.x
                                                        }
                                                        else{
                                                            
                                                            self.x = value.location.x - self.screen
                                                        }
                                                        
                                                    })
                                                    .onEnded({ (value) in
                                                        
                                                        if value.translation.width > 0{
                                                            
                                                            
                                                            if value.translation.width > ((self.screen - 80) / 2) && Int(self.count) != 0{
                                                                
                                                                
                                                                self.count -= 1
                                                                self.updateHeight(value: Int(self.count))
                                                                self.x = -((self.screen + 15) * self.count)
                                                            }
                                                            else{
                                                                
                                                                self.x = -((self.screen + 15) * self.count)
                                                            }
                                                        }
                                                        else{
                                                            
                                                            
                                                            if -value.translation.width > ((self.screen - 80) / 2) && Int(self.count) !=  (self.data.count - 1){
                                                                
                                                                self.count += 1
                                                                self.updateHeight(value: Int(self.count))
                                                                self.x = -((self.screen + 15) * self.count)
                                                            }
                                                            else{
                                                                
                                                                self.x = -((self.screen + 15) * self.count)
                                                            }
                                                        }
                                                    })
                            )
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
                .offset(x: self.op)
                
                Spacer()
            }
            .animation(.spring())
            .onAppear {
                
                self.op = ((self.screen + 15) * CGFloat(self.data.count / 2)) - (self.data.count % 2 == 0 ? ((self.screen + 15) / 2) : 0)
                
            }
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.3)
    }
    
    func updateHeight(value : Int){
        
        
        for i in 0..<data.count{
            
            data[i].show = false
        }
        
        data[value].show = true
    }
}

//struct CarouselView_Previews: PreviewProvider {
//  static var previews: some View {
//    CarouselView()
//  }
//}

struct CardView : View {
    
    var data : GameModel
    
    var body : some View{
        
        VStack(alignment: .leading, spacing: 0){
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
                WebImage(url: URL(string: data.backgroundImage))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: .fill)
                    .transition(.fade(duration: 0.5))
                
                Rectangle()
                    .foregroundColor(.clear)
                    .background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
                
                Text(data.name)
                    .font(.custom("Poppins-Bold", size: 20))
                    .foregroundColor(.white)
                    .padding(.top, data.name.count >= 18 ? -70 : -50
                    )
                    .frame(width: 200)
                    .multilineTextAlignment(.center)
            })
        }
        .frame(width: UIScreen.main.bounds.width / 1.7, height: data.show ?  UIScreen.main.bounds.height / 2.5 : (UIScreen.main.bounds.height / 2.5) - 50)
        .background(Color.white)
        .cornerRadius(25)
    }
}
