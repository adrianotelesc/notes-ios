//
//  NoteRepository.swift
//  Notes
//
//  Created by Adriano Teles on 28/09/23.
//

import Foundation

protocol NoteRepository {
    func getNotes() -> [Note]
}
