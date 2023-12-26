//
//  NoteEditingViewModel.swift
//  Notes
//
//  Created by Adriano Teles on 23/11/23.
//

import Foundation

class NoteEditingViewModel: ObservableObject {
    @Published var uiState = NoteEditingUiState()
    
    let noteRepo: NoteRepository
    
    init(noteId: String? = nil, noteRepo: NoteRepository) {
        self.noteRepo = noteRepo
        if let noteId = noteId {
            if let existingNote = noteRepo.findBy(id: noteId) {
                self.uiState = NoteEditingUiState(note: existingNote)
            }
        }
    }
    
    func updateText(text: String) {
        let newNote = Note(id: self.uiState.note.id, text: text)
        self.uiState = NoteEditingUiState(note: newNote)
        noteRepo.update(note: newNote)
    }
}
