//
//  NoteEditingScreen.swift
//  Notes
//
//  Created by Adriano Teles on 23/11/23.
//

import Foundation
import SwiftUI

struct NoteEditingScreen: View {
    @FocusState private var focused: Bool
    
    @State private var text: String = ""
    
    @StateObject private var viewModel: NoteEditingViewModel
    
    init(noteId: String? = nil, dependencies: Dependencies) {
        _viewModel = StateObject(wrappedValue: NoteEditingViewModel(noteId: noteId, noteRepo: dependencies.noteRepo))
    }
    
    var body: some View {
        TextEditor(text: $text)
            .navigationBarTitleDisplayMode(.inline)
            .focused($focused, equals: true)
            .onAppear(perform: {
                let note = viewModel.uiState.note
                self.text = note.text
                self.focused = note.isEmpty
            })
            .onChange(of: text) {
                viewModel.updateNote(text: text)
            }
            .autocorrectionDisabled()
            .textInputAutocapitalization(.none)
    }
}
