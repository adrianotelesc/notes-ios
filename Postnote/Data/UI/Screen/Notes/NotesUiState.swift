//
//  NotesUiState.swift
//  Notes
//
//  Created by Adriano Teles on 28/09/23.
//

import Foundation

struct NotesUiState {
    let notes: [Note]
    
    init(notes: [Note]  = []) {
        self.notes = notes
    }
}
