//
//  NotesViewModel.swift
//  Notes
//
//  Created by Adriano Teles on 28/09/23.
//

import Foundation
import Combine

class NotesViewModel: ObservableObject {
    private let noteRepo: NoteRepository
    private var notesSubscription: AnyCancellable? = nil
    
    @Published var uiState = NotesUiState()
    
    init(noteRepo: NoteRepository) {
        self.noteRepo = noteRepo

        loadNotes()
    }
    
    func loadNotes() {
        notesSubscription = noteRepo.notes.sink { notes in
            self.uiState = NotesUiState(notes: notes)
        }
    }
    
    deinit {
        notesSubscription?.cancel()
    }
}
