//
//  WordsView.swift
//  CompetitionApp
//
//  Created by Rahala, Jasamrit (Coll) on 18/06/2021.
//

import SwiftUI
import CoreData

struct WordsView: View {
    
    @State var currentUser: Person
    
    var body: some View {
        VStack{
            ForEach(currentUser.wordlist!.components(separatedBy: ", "), id: \.self){ word in
                Text(word)
            }
        }
    }
    
}
