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
    @State var questionNumber: Int = 0
    @State var correct: WordResponse? = nil
        
    var body: some View{
        NavigationView{
            VStack{
                if (testWords).count == 4 && questionNumber < 2{
                    questionNumber += 1
                    Text("Definition")
                    let correct = testWords.randomElement()!
                    Text(correct.meanings?[0].definitions?[0].definition ?? "")
                    
                    VStack{
                        ForEach(0..<4, id: \.self){ index in
                            Button(action: {
                                wordPressed(choice: testWords[index])
                            }, label: {Text(testWords[index].word!)})
                            
                        }
                    }
                }
            }
            .onAppear(perform: {
                testWords = []
                for _ in 0..<2{
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
    
    func wordPressed(choice: WordResponse){
        var alertTitle = ""
        if choice == correct{
            alertTitle = "Well done"
        }
        else{
            alertTitle = "Unlucky"
        }
        
        let alertMessage = "The correct answer was \(correct?.word!)"
        Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("continue")))
        testWords = []
        for _ in 0..<2{
            (requestWord(level: difficultyLevel, callback: {data in
                print("words retrieved", data.word)
                requestDefinition(word: data.word, callback: {def in
                    testWords.append(def)
                    //print("definition retrieved", testWords)
                })
            }))
        }
    }
    
}

