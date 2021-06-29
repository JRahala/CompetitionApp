//
//  WordsView.swift
//  CompetitionApp
//
//  Created by Rahala, Jasamrit (Coll) on 18/06/2021.
//


// make this scrollable

import SwiftUI
import CoreData

struct WordsView: View {
    
    @State var currentUser: Person
    
    var body: some View {
        VStack{
            ScrollView{
                ForEach(currentUser.wordlist!.components(separatedBy: ", "), id: \.self){ word in
                    VStack{
                        DefinitionView(currentUser: currentUser, searchQuery: word, response: nil)
                    }
                }
            }
        }
    }
    
}
