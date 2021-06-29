//
//  TestView.swift
//  CompetitionApp
//
//  Created by Rahala, Jasamrit (Coll) on 18/06/2021.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var learningStack: LastLearnt
    
    @State var currentUser: Person
    @State var testWords: [WordResponse] = []
    var difficultyLevel: Int64 {
        currentUser.experience / 100 + 3
    }
    @State var questionNumber: Int = 0
    @State var correct: WordResponse? = nil
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""
    @State var showingAlert: Bool = false
    @State var score: Int = 0
    
    var body: some View{
        NavigationView{
            VStack{
                if (testWords).count == 4 && questionNumber < 10{
                    
                    if showingAlert{
                        Text(alertTitle)
                            .font(.custom("Charter", size: 30))
                        
                        Text(alertMessage)
                            .font(.custom("Charter", size: 20))
                        
                        Button(action: {
                            showingAlert = false
                            questionNumber += 1
                        }, label: {
                            ZStack{
                                Rectangle()
                                    .fill(Color.black)
                                    .frame(width: 300, height: 50)
                                
                                Text("continue")
                                    .font(.custom("Charter", size: 20))
                                    .foregroundColor(.white)
                            }
                        })
                    
                    }
                    
                    else{
                        ZStack{
                            Rectangle()
                                .fill(Color("lightgrey"))
                            VStack{
                                Text("Definition:")
                                    .font(.custom("Charter", size: 40))
                                    .fontWeight(.heavy)
                                
                                let correct = testWords.randomElement()!
                                Text(correct.meanings?[0].definitions?[0].definition ?? "")
                                    .font(.custom("Charter", size: 30))
                                    .italic()
                            }
                        }
                        
                        Spacer()
                            .frame(height: 50)
                        
                        VStack{
                            ForEach(0..<4, id: \.self){ index in
                                Button(action: {
                                    (alertTitle, alertMessage) = wordPressed(choice: testWords[index])
                                }, label: {
                                    ZStack{
                                        Rectangle()
                                            .fill(Color.black)
                                            .frame(width: 300, height: 50)
                                        
                                        Text(testWords[index].word!)
                                            .font(.custom("Charter", size: 20))
                                            .foregroundColor(.white)
                                    }
                                })
                                
                            }
                        }
                    }
                }
                
            }
            .onAppear(perform: {
                testWords = []
                showingAlert = false
                for _ in 0..<2{
                    (requestWord(level: difficultyLevel, callback: {data in
                        print("words retrieved", data.word)
                        requestDefinition(word: data.word, callback: {def in
                            testWords.append(def)
                            //print("definition retrieved", testWords)
                            currentUser.wordlist = currentUser.wordlist! + ", " + data.word
                            learningStack.push(value: def)
                        })
                    }))
                }
            })
        }

    }
    
    func wordPressed(choice: WordResponse) -> (String, String){
        
        if choice == correct{
            alertTitle = "Well done"
            score += 1
        }
        else{
            alertTitle = "Unlucky"
        }
        
        alertMessage = "The correct answer was \(correct?.word!)"
        testWords = []
        for _ in 0..<4{
            (requestWord(level: difficultyLevel, callback: {data in
                print("words retrieved", data.word)
                requestDefinition(word: data.word, callback: {def in
                    testWords.append(def)
                    //print("definition retrieved", testWords)
                })
            }))
        }
        print("Request made!")
        showingAlert = true
        return (alertTitle, alertMessage)
    }
    
}

