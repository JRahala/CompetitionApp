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
        
        Text(currentUser.username!)
        Text(currentUser.password!)
    
        Text("Menu View")
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    
    }
    
}
