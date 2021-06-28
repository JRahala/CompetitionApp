//
//  ProfileView.swift
//  CompetitionApp
//
//  Created by Rahala, Jasamrit (Coll) on 27/06/2021.
//

import SwiftUI

struct ProfileView: View {
    
    // !!! this will remove the items from the stack as they are loaded
    
    @EnvironmentObject var learningStack: LastLearnt
    @State var currentUser: Person
    @State var loadNumber: Int = 10
    @State var loadedWords: [WordResponse] // load the words from the learning stack into here when needed
    
    var body: some View {
        VStack{
            ForEach(loadedWords, id: \.self){ word in
                DefinitionView(currentUser: currentUser, searchQuery: word.word!, response: nil)
            }
            Button(action: loadWords, label: {Text("Load \(loadNumber) more words ... ")})
        }
    }
    
    func loadWords(){
        var i = loadNumber
        while i > 0 && learningStack.isEmpty() != true{
            loadedWords.append(learningStack.pop() as! WordResponse)
        }
    }
}
