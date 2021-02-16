//
//  SearchView.swift
//  Brick
//
//  Created by Rivaldi Aliando on 24/12/20.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchValue = ""
    
    @State private var isEditing = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        ScrollView(showsIndicators: false){
            Text("Test")
        }
        .background(
            Image("bg_search")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//            Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        )
        .frame(width: UIScreen.main.bounds.width)
        .toolbar(content: {
            ToolbarItem(placement: .principal){
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        ZStack(alignment: Alignment(horizontal: .center, vertical: .center), content: {
                            Image(systemName: "square.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .foregroundColor(.gray)

                            Image(systemName: "chevron.backward.square.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .foregroundColor(Color(.systemGray6))
                        })
                    }
                    TextField("Search games", text: $searchValue)
                        .frame(width: UIScreen.main.bounds.width - 160)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .overlay(
                            HStack {
                                Image("search")
                                    .resizable()
                                    .frame(width: 17, height: 17)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 8)
                                
                                if isEditing {
                                    Button(action: {
                                        self.searchValue = ""
                                    }) {
                                        Image(systemName: "multiply.circle.fill")
                                            .foregroundColor(.gray)
                                            .padding(.trailing, 8)
                                    }
                                }
                            }
                        )
                        .padding(.horizontal, 10)
                        .onTapGesture {
                            self.isEditing = true
                        }
                    
                }
            }
        })
        .navigationBarBackButtonHidden(true)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
