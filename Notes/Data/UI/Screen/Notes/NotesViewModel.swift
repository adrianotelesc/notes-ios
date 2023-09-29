//
//  NotesViewModel.swift
//  Notes
//
//  Created by Adriano Teles on 28/09/23.
//

import Foundation

class NotesViewModel: ObservableObject {
    @Published var uiState = NotesUiState()
    
    let notesRepo = NoteRepositoryImpl()
    
    init() {
        loadNotes()
    }
    
    func loadNotes() {
        uiState = NotesUiState(notes: notesRepo.getNotes())
    }
}
