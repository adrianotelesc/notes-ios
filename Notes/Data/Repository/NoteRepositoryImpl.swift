//
//  NoteRepositoryImpl.swift
//  Notes
//
//  Created by Adriano Teles on 28/09/23.
//

import Foundation

class NoteRepositoryImpl: NoteRepository {
    func getNotes() -> [Note] {
        return (1...5).map { Note(text: "This is note \($0)") }
    }
}
