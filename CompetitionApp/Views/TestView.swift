//
//  TestView.swift
//  CompetitionApp
//
//  Created by Rahala, Jasamrit (Coll) on 18/06/2021.
//

import SwiftUI

struct TestView: View {
    
    @State var currentUser: Person
    @State var testWords: [WordResponse] = []
    var difficultyLevel: Int64 {
        currentUser.experience / 100 + 3
    }
        
    var body: some View{
        NavigationView{
            VStack{
                if (testWords).count == 4{
                    VStack{
                        ForEach(0..<4, id: \.self){ index in
                            Text(testWords[index].word!)
                        }
                    }
                }
            }
            .onAppear(perform: {
                testWords = []
                for i in 0..<2{
                    (requestWord(level: difficultyLevel, callback: {data in
                        print("words retrieved", data.word)
                        requestDefinition(word: data.word, callback: {def in
                            testWords.append(def)
                            //print("definition retrieved", testWords)
                        })
                    }))
                }
            })
        }
    }
    
}

