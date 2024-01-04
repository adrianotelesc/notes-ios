//
//  NoteEditingViewModel.swift
//  Notes
//
//  Created by Adriano Teles on 23/11/23.
//

import Foundation

extension NoteEditorView {
    @MainActor class ViewModel: ObservableObject {
        private let noteRepo: NoteRepository
        
        @Published var text: String {
            didSet {
                updateNote()
            }
        }

        private var note = Note()
        
        init(noteId: String?, noteRepo: NoteRepository) {
            self.noteRepo = noteRepo

            if let noteId = noteId {
                if let existingNote = noteRepo.findBy(id: noteId) {
                    self.note = existingNote
                }
            }

            self.text = self.note.text
        }

        private func updateNote() {
            self.note = note.copy(text: self.text)
            noteRepo.update(note: note)
        }
    }
}
