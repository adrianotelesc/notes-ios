//
//  NotesViewModel.swift
//  Notes
//
//  Created by Adriano Teles on 28/09/23.
//

import Foundation
import Combine

class NotesViewModel: ObservableObject {
    @Published var uiState = NotesUiState()
    
    let notesRepo = NoteRepositoryImpl()
    
    var subscription: AnyCancellable? = nil
    
    init() {
        loadNotes()
    }
    
    func loadNotes() {
        subscription = notesRepo.notes.sink { notes in
            self.uiState = NotesUiState(notes: notes)
        }
    }
    
    func addNote() {
        notesRepo.addNote(note: Note(text: "This is note \(uiState.notes.count + 1)"))
    }
    
    deinit {
        subscription?.cancel()
    }
}
