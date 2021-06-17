//
//  RegisterView.swift
//  CompetitionApp
//
//  Created by Rahala, Jasamrit (Coll) on 16/06/2021.
//

import SwiftUI

struct RegisterView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var repeatPassword: String = ""
    
    var body: some View {
        VStack{
            Text("Register View")
            TextField("Username", text: $username)
            SecureField("Password", text: $password)
            SecureField("Repeat password", text: $repeatPassword)
            Button(
                action: {
                    //registerUser()
                },
                label: {
                    Text("Register User")
                })
        }
        .padding()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
