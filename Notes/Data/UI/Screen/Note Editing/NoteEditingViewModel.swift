//
//  NoteEditingViewModel.swift
//  Notes
//
//  Created by Adriano Teles on 23/11/23.
//

import Foundation

class NoteEditingViewModel: ObservableObject {
    private let noteRepo: NoteRepository
    
    @Published var uiState = NoteEditingUiState()
    
    init(noteId: String? = nil, noteRepo: NoteRepository) {
        self.noteRepo = noteRepo

        if let noteId = noteId {
            if let existingNote = noteRepo.findBy(id: noteId) {
                self.uiState = NoteEditingUiState(note: existingNote)
            }
        }
    }

    func updateNote(text: String) {
        let changedNote = uiState.note.copy(text: text)
        self.uiState = NoteEditingUiState(note: changedNote)
        noteRepo.update(note: changedNote)
    }
}
