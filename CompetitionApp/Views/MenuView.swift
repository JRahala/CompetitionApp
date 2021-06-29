//
//  MenuView.swift
//  CompetitionApp
//
//  Created by Rahala, Jasamrit (Coll) on 16/06/2021.
//


import SwiftUI

struct MenuView: View {
    
    @State var currentUser: Person
    
    var body: some View {
        
        VStack{
            
            Text("Welcome back, " + currentUser.username!)
                .font(.custom("Charter", size: 50))
            
            Spacer()
                .frame(height: 50)
            
            NavigationLink(destination: WordsView(currentUser: currentUser),
                           label: {
                            ZStack {
                                Image("WordsView")
                                    .resizable()
                                    .frame(minWidth: 400)
                                    .brightness(-0.2)
                                    .blur(radius: 0.2)
                                
                                Text("View Library")
                                    .font(.custom("Charter", size: 40))
                                    .fontWeight(.bold)
                                    
                                    .foregroundColor(.white)
                            }
                           })
            
            NavigationLink(destination: SearchView(currentUser: currentUser),
                           label: {
                            ZStack {
                                Image("SearchView")
                                    .resizable()
                                    .frame(minWidth: 400)
                                    .brightness(-0.2)
                                    .blur(radius: 0.2)
                                
                                Text("Search Definitions")
                                    .font(.custom("Charter", size: 40))
                                    .fontWeight(.bold)
                                    
                                    .foregroundColor(.white)
                            }
                           })
            
            NavigationLink(destination: TestView(currentUser: currentUser),
                           label: {
                            ZStack {
                                Image("TestView")
                                    .resizable()
                                    .frame(minWidth: 400)
                                    .brightness(-0.2)
                                    .blur(radius: 0.2)
                                
                                Text("Test your knowledge")
                                    .font(.custom("Charter", size: 40))
                                    .fontWeight(.bold)
                                    
                                    .foregroundColor(.white)
                            }
                           })
            
            NavigationLink(destination: ProfileView(currentUser: currentUser),
                           label: {
                            ZStack {
                                Image("ProfileView")
                                    .resizable()
                                    .frame(minWidth: 400)
                                    .brightness(-0.2)
                                    .blur(radius: 0.2)
                                
                                Text("Recent Words")
                                    .font(.custom("Charter", size: 40))
                                    .fontWeight(.bold)
                                    
                                    .foregroundColor(.white)
                            }
                           })
            
        }
        
        // add latest words stack
        // add sorting algorithm
            
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    
    }
    
}

