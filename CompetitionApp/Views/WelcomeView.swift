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
            NavigationLink(
                destination: RegisterView(),
                label: {
                    Text("Register")
                })
            NavigationLink(
                destination: LoginView(),
                label: {
                    Text("Login")
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
