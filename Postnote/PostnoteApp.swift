//
//  NotesApp.swift
//  Notes
//
//  Created by Adriano Teles on 23/09/23.
//

import SwiftUI

class DependencyContainer: ObservableObject {
    let noteRepo: NoteRepository = NoteRepositoryImpl()
}

@main
struct PostnoteApp: App {
    @StateObject private var dependencyContainer = DependencyContainer()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dependencyContainer)
        }
    }
}
