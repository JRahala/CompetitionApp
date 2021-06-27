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
            
            if let response = response{
                ForEach(response.meanings ?? [], id: \.self){ meaning in
                    Text(meaning.partOfSpeech!)
                    ForEach(meaning.definitions ?? [], id: \.self){ definition in
                        Text("-----")
                        Text(definition.definition ?? "")
                        Text(definition.example ?? "")
                    }
                }
            }
            // end of response
            
        }.onAppear(perform: {requestDefinition(word: searchQuery, callback: { data in
            print(data.word ?? "")
            response = data
        })})
    }
        
}


