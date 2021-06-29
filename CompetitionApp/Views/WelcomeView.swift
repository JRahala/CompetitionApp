//
//  WelcomeView.swift
//  CompetitionApp
//
//  Created by Rahala, Jasamrit (Coll) on 16/06/2021.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView{
            VStack{
            Text("Vocabulary Builder")
                .font(.custom("Charter", size: 50))
                
            Image("BooksImage")
                .resizable()
                .scaledToFit()
                
            Spacer()
                .frame(height: 20)
                
            Divider()
                .frame(maxWidth: 200)
                
            
            Text("Vocabulary is a matter of word-building as well as word-using ~ David Crystal")
                .font(.custom("Charter", size: 15))
                .italic()
            
            Divider()
                .frame(maxWidth: 200)
                
            Spacer()
                .frame(height: 40)
                
            NavigationLink(
                destination: RegisterView(),
                label: {
                    ZStack{
                        Rectangle()
                            .fill(Color.secondary)
                            .frame(width: 200, height: 50)
                        
                        Text("Register")
                            .font(.custom("Charter", size: 30))
                            .foregroundColor(.white)
                    }
                })
                
            Spacer()
                .frame(height: 20)
                
            NavigationLink(
                destination: LoginView(),
                label: {
                    ZStack{
                        Rectangle()
                            .fill(Color.secondary)
                            .frame(width: 200, height: 50)
                        
                        Text("Login")
                            .font(.custom("Charter", size: 30))
                            .foregroundColor(.white)
                    }
                })
            }
        }.padding()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
