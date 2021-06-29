//
//  DefinitionView.swift
//  CompetitionApp
//
//  Created by Rahala, Jasamrit (Coll) on 18/06/2021.
//

import SwiftUI


struct DefinitionView: View {

    @State var currentUser: Person
    @State var searchQuery: String
    @State var response: WordResponse?
    
    var body: some View {
        
        VStack{
            
            if let response = response {
                
                ZStack{
                    
                    Rectangle()
                        .fill(Color("lightgrey"))
                        .shadow(radius: 10)
                    
                    VStack(alignment: .leading){
                        ScrollView{
                            
                        Text(response.word!)
                            .font(.custom("Charter", size: 25))
                            
                        ForEach(response.meanings ?? [], id: \.self){ meaning in
                            Text(meaning.partOfSpeech!)
                                .font(.custom("Charter", size: 15))
                                .italic()
                            ForEach(meaning.definitions ?? [], id: \.self){ definition in
                                Text(definition.definition ?? "")
                                    .font(.custom("Charter", size: 20))
                                Text(definition.example ?? "")
                                    .font(.custom("Charter", size: 20))
                                    .fontWeight(.light)
                                Divider()
                            }
                        }
                        }
                    }.padding()
                    
                }
                
            }
            // end of response
            
        }.onAppear(perform: {requestDefinition(word: searchQuery, callback: { data in
            print(data.word ?? "")
            response = data
        })})
    }
        
}


