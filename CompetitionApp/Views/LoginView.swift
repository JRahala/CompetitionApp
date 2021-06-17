//
//  LoginView.swift
//  CompetitionApp
//
//  Created by Rahala, Jasamrit (Coll) on 16/06/2021.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        Text("Login View")
            NavigationLink(
                destination: LoginView(), //MenuView(),
                label:{
                    Text("Menu View")
            })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
