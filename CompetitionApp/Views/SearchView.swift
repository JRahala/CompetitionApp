//
//  SearchView.swift
//  CompetitionApp
//
//  Created by Rahala, Jasamrit (Coll) on 27/06/2021.
//

import SwiftUI

struct SearchView: View {
    
    @State var currentUser: Person
    @State var searchQuery: String = ""
    @State var response: WordResponse? = nil
    
    var body: some View {
        
        VStack{
            
            TextField("Search query...", text: $searchQuery)
            
            Button(action: {requestDefinition(word: searchQuery, callback: {data in
                response = data
            })}, label: {Text("Search word")})
            
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
            
        }.padding(10)
        
    }
}


