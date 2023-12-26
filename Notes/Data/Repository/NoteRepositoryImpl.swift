//
//  NoteRepositoryImpl.swift
//  Notes
//
//  Created by Adriano Teles on 28/09/23.
//

import Foundation
import Combine

class NoteRepositoryImpl: NoteRepository {
    private var notesSubject = CurrentValueSubject<[Note], Never>([])
    var notes: AnyPublisher<[Note], Never> {
        return notesSubject.eraseToAnyPublisher()
    }
    
    func findBy(id: String) -> Note? {
        let notes = notesSubject.value
        return notes.first(where: { note in note.id == id })
    }
    
    func update(note: Note) {
        if let existingNote = findBy(id: note.id) {
            if note.isEmpty {
                remove(note: existingNote)
            } else if (existingNote != note) {
                replace(oldNote: existingNote, newNote: note)
            }
        } else {
            add(note: note)
        }
    }
    
    func add(note: Note) {
        guard note.isNotEmpty else {
            return
        }
        sendNotesSubject { ( notes: inout [Note]) in
            notes.insert(note, at: 0)
        }
    }
    
    private func sendNotesSubject(block: (inout [Note]) -> Void) {
        var notes = notesSubject.value
        block(&notes)
        notesSubject.send(notes)
    }
    
    func remove(note: Note) {
        sendNotesSubject { ( notes: inout [Note]) in
            notes.removeAll { item in item.id == note.id }
        }
    }
    
    func replace(oldNote: Note, newNote: Note) {
        sendNotesSubject { ( notes: inout [Note]) in
            let index = notes.firstIndex(where: { note in oldNote.id == note.id }) ?? 0
            notes.remove(at: index)
            notes.insert(newNote, at: index)
        }
    }
}
