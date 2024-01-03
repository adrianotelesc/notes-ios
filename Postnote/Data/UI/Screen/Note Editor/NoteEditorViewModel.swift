//
//  NoteEditingViewModel.swift
//  Notes
//
//  Created by Adriano Teles on 23/11/23.
//

import Foundation

class NoteEditorViewModel: ObservableObject {
    private let noteRepo: NoteRepository
    
    @Published private(set) var uiState = NoteEditorUiState()
    
    init(noteId: String?, noteRepo: NoteRepository) {
        self.noteRepo = noteRepo

        if let noteId = noteId {
            if let existingNote = noteRepo.findBy(id: noteId) {
                self.uiState = NoteEditorUiState(note: existingNote)
            }
        }
    }

    func updateNote(text: String) {
        let changedNote = uiState.note.copy(text: text)
        self.uiState = NoteEditorUiState(note: changedNote)
        noteRepo.update(note: changedNote)
    }
}
