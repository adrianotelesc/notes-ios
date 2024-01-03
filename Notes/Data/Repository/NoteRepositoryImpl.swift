//
//  NoteRepositoryImpl.swift
//  Notes
//
//  Created by Adriano Teles on 28/09/23.
//

import Foundation
import Combine

class NoteRepositoryImpl: NoteRepository {
    private var _notes = CurrentValueSubject<[Note], Never>([])

    var notes: AnyPublisher<[Note], Never> {
        _notes.eraseToAnyPublisher()
    }
    
    func findBy(id: String) -> Note? {
        _notes.value.first(where: { note in note.id == id })
    }
    
    func update(note: Note) {
        if let existingNote = findBy(id: note.id) {
            if existingNote.isNotEmpty && note.isEmpty {
                remove(note: existingNote)
            } else if (existingNote != note) {
                replace(oldNote: existingNote, newNote: note)
            }
        } else {
            add(note: note)
        }
    }
    
    func add(note: Note) {
        guard note.isNotEmpty else { return }
        sendNotes { (notes: inout [Note]) in
            notes.insert(note, at: 0)
        }
    }
    
    private func sendNotes(block: (inout [Note]) -> Void) {
        var notes = _notes.value
        block(&notes)
        _notes.send(notes)
    }
    
    func remove(note: Note) {
        sendNotes { (notes: inout [Note]) in
            notes.removeAll { item in item.id == note.id }
        }
    }
    
    func replace(oldNote: Note, newNote: Note) {
        sendNotes { (notes: inout [Note]) in
            let index = notes.firstIndex(where: { note in oldNote.id == note.id }) ?? 0
            notes.remove(at: index)
            notes.insert(newNote, at: index)
        }
    }
}
