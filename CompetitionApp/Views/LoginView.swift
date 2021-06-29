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
            
            Text("Login")
                .font(.custom("Charter", size: 30))
            
            TextField("Username", text: $username)
                .font(.custom("Charter", size: 20))
            
            SecureField("Password", text: $password)
                .font(.custom("Charter", size: 20))
            
            Spacer()
                .frame(height: 30)
            
            
            Button(action: {
                result = loginUser()
            }, label: {
                ZStack{
                    Rectangle()
                        .fill(Color.secondary)
                        .frame(width: 200, height: 50)
                    
                    Text("Login")
                        .font(.custom("Charter", size: 30))
                        .foregroundColor(.white)
                }
            })
            
            if result != "" {
                Text("Result: \(result)")
                    .font(.custom("Charter", size: 20))
                
            }
            
            if result == "Login successful!"{
                NavigationLink(destination: {
                    MenuView(currentUser: currentUser!)
                }(), label: {
                    ZStack{
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 300, height: 50)
                        
                        Text("Continue to menu screen")
                            .font(.custom("Charter", size: 20))
                            .foregroundColor(.white)
                    }
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
