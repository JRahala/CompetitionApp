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
            
            NavigationLink(destination: WordsView(currentUser: currentUser),
                           label: {Text("View words")})
            
            NavigationLink(destination: TestView(),
                           label: {Text("Take a test")})
            
            NavigationLink(destination: ExploreView(),
                           label: {Text("Explore new words")})
            
            Text("Menu View")
            
        }
            
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    
    }
    
}
