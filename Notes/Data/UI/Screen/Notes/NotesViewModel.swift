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
        let noteCount = uiState.notes.count + 1
        let text = if (noteCount % 2 == 0) {
            "This is note  \(noteCount).\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer congue metus accumsan aliquet vestibulum. Sed pellentesque diam tincidunt ligula sollicitudin porttitor."
        } else {
            "This is note \(noteCount)."
        }
        notesRepo.addNote(note: Note(text: text))
    }
    
    deinit {
        subscription?.cancel()
    }
}
