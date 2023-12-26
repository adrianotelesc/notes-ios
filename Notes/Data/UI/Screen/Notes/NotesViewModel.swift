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
    
    private let noteRepo: NoteRepository
    
    var subscription: AnyCancellable? = nil
    
    init(noteRepo: NoteRepository) {
        self.noteRepo = noteRepo
        loadNotes()
    }
    
    func loadNotes() {
        subscription = noteRepo.notes.sink { notes in
            self.uiState = NotesUiState(notes: notes)
        }
    }
    
    deinit {
        subscription?.cancel()
    }
}
