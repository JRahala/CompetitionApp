//
//  LoginView.swift
//  CompetitionApp
//
//  Created by Rahala, Jasamrit (Coll) on 16/06/2021.
//

import SwiftUI

struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var result: String = ""
    @State var currentUser: Person? = nil
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Person.entity(), sortDescriptors: []) var people: FetchedResults<Person>
    
    var body: some View {
        VStack{
            
            Text("Login View")
            
            TextField("Username", text: $username)
            SecureField("Password", text: $password)
            
            Button(action: {
                result = loginUser()
            }, label: {
                Text("Login")
            })
            
            if result != "" {
                Text("Result: \(result)")
                
            }
            
            if result == "Login successful!"{
                NavigationLink(destination: {
                    MenuView(currentUser: currentUser!)
                }(), label: {
                    Text("Continue to menu screen")
                })
            }
        }
        .padding()
    }
    
    func loginUser() -> String {
        for person in people{
            if (person.username! == self.username){
                if (person.password == self.password){
                    currentUser = person
                    return "Login successful!"
                }
                else{
                    return "Incorrect password"
                }
            }
        }
        return "Incorrect username"
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
