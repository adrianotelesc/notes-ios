//
//  NoteEditingUiState.swift
//  Notes
//
//  Created by Adriano Teles on 23/11/23.
//

import Foundation

struct NoteEditorUiState {
    let note: Note
    
    init(note: Note = Note()) {
        self.note = note
    }
}