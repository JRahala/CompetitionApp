//
//  CompetitionAppApp.swift
//  CompetitionApp
//
//  Created by Rahala, Jasamrit (Coll) on 16/06/2021.
//

import SwiftUI

@main
struct CompetitionAppApp: App {
    
    // store the persistence controller
    let persistenceController = PersistenceController.preview
    
    // latest words learnt by the user
    let learningStack = LastLearnt()
    
    // state of scene
    @Environment(\.scenePhase) var scenePhase
    
    
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                // reference the controller via environment
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(learningStack)
        }
        // save changes whever the scene changes
        .onChange(of: scenePhase){ _ in
            persistenceController.save()
        }
    }
}
