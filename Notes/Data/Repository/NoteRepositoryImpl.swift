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
        var notes = notesSubject.value
        notes.insert(note, at: 0)
        notesSubject.send(notes)
    }
    
    func remove(note: Note) {
        var notes = notesSubject.value
        notes.removeAll { item in
            item.id == note.id
        }   
        notesSubject.send(notes)
    }
    
    func replace(oldNote: Note, newNote: Note) {
        var notes = notesSubject.value
        let index = notes.firstIndex(where:  { note in oldNote.id == note.id }) ?? 0
        notes.remove(at: index)
        notes.insert(newNote, at: index)
        notesSubject.send(notes)
    }
}
