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
    
    func addNote(note: Note) {
        var currentNotes = notesSubject.value
        currentNotes.insert(note, at: 0)
        notesSubject.send(currentNotes)
    }
}
