//
//  PersistenceController.swift
//  CompetitionApp
//
//  Created by Rahala, Jasamrit (Coll) on 16/06/2021.
//

import Foundation
import CoreData

struct PersistenceController{
    
    // shared singleton between the app
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    // factory function to produce fake data
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        for i in 0..<10{
            let person = Person(context: controller.container.viewContext)
            person.username = "username #\(i)"
            person.password = "password #\(i)"
            person.experience = 0
            person.wordlist = "potential"
        }
        return controller
    }()
    
    // initialiser to load Core Data
    init(inMemory: Bool = false){
        container = NSPersistentContainer(name: "Model")
        // inMemory = save changes made to memory / disk
        if inMemory{
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
            
        }
        
        container.loadPersistentStores{ description, error in
            if let error = error{
                fatalError("Error: \(error.localizedDescription)")
            }
        }
        
        // initialise with fake data by default
        let person = Person(context: container.viewContext)
        person.username = "User"
        person.password = "pass"
        person.experience = 0
        person.wordlist = "potential"
        
    }
    
    // save changes made to the context
    func save(){
        let context = container.viewContext
        if context.hasChanges{
            do {
                try context.save()
            } catch{
                print("Error could not save")
            }
        }
    }
    
}
