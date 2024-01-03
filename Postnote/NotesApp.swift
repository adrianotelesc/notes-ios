//
//  NotesApp.swift
//  Notes
//
//  Created by Adriano Teles on 23/09/23.
//

import SwiftUI

class Dependencies: ObservableObject {
    let noteRepo: NoteRepository = NoteRepositoryImpl()
}

@main
struct NotesApp: App {
    @StateObject private var dependencies = Dependencies()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dependencies)
        }
    }
}
