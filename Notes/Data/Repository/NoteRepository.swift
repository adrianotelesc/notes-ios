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
}
