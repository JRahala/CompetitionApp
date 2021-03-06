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
    @State var result: String = ""
    @State var currentUser: Person? = nil
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Person.entity(), sortDescriptors: []) var people: FetchedResults<Person>
    
    var body: some View {
        VStack{
            
            Text("Registration")
                .font(.custom("Charter", size: 30))
            
            TextField("Username", text: $username)
                .font(.custom("Charter", size: 20))
            
            SecureField("Password", text: $password)
                .font(.custom("Charter", size: 20))
            
            SecureField("Repeat password", text: $repeatPassword)
                .font(.custom("Charter", size: 20))
            
            Spacer()
                .frame(height: 30)
            
            
            Button(action: {
                result = registerUser()
            }, label: {
                ZStack{
                    Rectangle()
                        .fill(Color.secondary)
                        .frame(width: 200, height: 50)
                    
                    Text("Register")
                        .font(.custom("Charter", size: 30))
                        .foregroundColor(.white)
                }
            })
            
            if result != "" {
                Text("Result: \(result)")
                    .font(.custom("Charter", size: 20))
                
            }
            
            if result == "Registration succesful!"{
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
    
    func registerUser() -> String{
        
        for person in people{
            if person.username! == self.username{
                return "Username taken"
            }
        }
        
        if self.password != self.repeatPassword{
            return "Passwords do not match"
        }
        
        var containsNumber = false
        for number in "0123456789"{
            if self.password.contains(number){
                containsNumber = true
                break
            }
        }
        
        if containsNumber == false { return "Password must contain a number" }
        if password == username{ return "Password cannot be the same as username" }
        if (8 <= password.count && password.count <= 30) == false { return "Password must be between 8 and 30 characters long" }
        if (8 <= username.count && username.count <= 30) == false { return "Username must be between 8 and 30 characters long" }
        
        let person = Person(context: managedObjectContext)
        person.username = self.username
        person.password = self.password
        person.wordlist = "empty"
        person.experience = 0
        
        do {
            try managedObjectContext.save()
            self.currentUser = person
            return "Registration succesful!"
        } catch {
            return "Error saving"
        }
    
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
