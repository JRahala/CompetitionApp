//
//  MenuView.swift
//  CompetitionApp
//
//  Created by Rahala, Jasamrit (Coll) on 16/06/2021.
//


import SwiftUI

struct MenuView: View {
    
    @State var currentUser: Person
    @State var searchQuery: String = ""
    
    var body: some View {
        
        VStack{
            
            Text("Username: " + currentUser.username!)
            TextField("Search field...", text: $searchQuery)
            
            Text("Load some random words that they just learnt")
            Text("Load some quote of the day")
            Text("videos about learning spellings")
            
            NavigationLink(destination: WordsView(currentUser: currentUser),
                           label: {Text("View words")})
            
            NavigationLink(destination: SearchView(currentUser: currentUser),
                           label: {Text("Search for definitions")})
            
            NavigationLink(destination: TestView(),//currentUser: currentUser),
                           label: {Text("Take a test")})
            
            NavigationLink(destination: ProfileView(currentUser: currentUser),
                           label: {Text("View profile")})
            
            Text("Menu View")
            
        }
            
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    
    }
    
}

