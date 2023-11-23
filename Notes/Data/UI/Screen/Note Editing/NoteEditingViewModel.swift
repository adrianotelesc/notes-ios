//
//  NoteEditingViewModel.swift
//  Notes
//
//  Created by Adriano Teles on 23/11/23.
//

import Foundation

class NoteEditingViewModel: ObservableObject {
    @Published var uiState = NoteEditingUiState()
}
