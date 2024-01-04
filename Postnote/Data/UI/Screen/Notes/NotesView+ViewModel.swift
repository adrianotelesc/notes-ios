//
//  NotesViewModel.swift
//  Notes
//
//  Created by Adriano Teles on 28/09/23.
//

import Foundation
import Combine

extension NotesView {
    @MainActor class ViewModel: ObservableObject {
        private let noteRepo: NoteRepository

        private var notesCancellable: AnyCancellable? = nil
        
        @Published private(set) var notes: [Note] = []
        
        init(noteRepo: NoteRepository) {
            self.noteRepo = noteRepo

            loadNotes()
        }
        
        private func loadNotes() {
            notesCancellable = noteRepo.notes.sink { notes in
                self.notes = notes
            }
        }
        
        deinit {
            notesCancellable?.cancel()
        }
    }
}
