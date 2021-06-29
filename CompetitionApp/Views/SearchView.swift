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
                .font(.custom("Charter", size: 20))
            
            Spacer()
                .frame(height: 20)
            
            if let response = response{
                
                
                ZStack{
                    
                    Rectangle()
                        .fill(Color("lightgrey"))
                        .shadow(radius: 10)
                    
                    VStack(alignment: .leading){
                        ScrollView{
                        ForEach(response.meanings ?? [], id: \.self){ meaning in
                            Text(meaning.partOfSpeech!)
                                .font(.custom("Charter", size: 15))
                                .italic()
                            ForEach(meaning.definitions ?? [], id: \.self){ definition in
                                Text(definition.definition ?? "")
                                    .font(.custom("Charter", size: 20))
                                Text(definition.example ?? "")
                                    .font(.custom("Charter", size: 20))
                                Divider()
                            }
                        }
                        }
                    }.padding()
                    
                }
                
                Spacer()
                    .frame(height: 20)
            
            }
            // end of response
            
            Button(action: {requestDefinition(word: searchQuery, callback: {data in
                response = data
            })}, label: {
                ZStack{
                    Rectangle()
                        .fill(Color.secondary)
                        .frame(width: 200, height: 50)
                    
                    Text("Search word")
                        .font(.custom("Charter", size: 30))
                        .foregroundColor(.white)
                }
            })
            
            
        }.padding(10)
        
    }
}


