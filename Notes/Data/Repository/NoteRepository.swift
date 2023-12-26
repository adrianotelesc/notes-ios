//
//  NoteRepository.swift
//  Notes
//
//  Created by Adriano Teles on 28/09/23.
//

import Foundation
import Combine

protocol NoteRepository {
    var notes: AnyPublisher<[Note], Never> { get }
    
    func findBy(id: String) -> Note?
    
    func update(note: Note)
    
    func add(note: Note)
    
    func remove(note: Note)
    
    func replace(oldNote: Note, newNote: Note)
}
