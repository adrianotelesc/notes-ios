//
//  NoteEditingScreen.swift
//  Notes
//
//  Created by Adriano Teles on 23/11/23.
//

import Foundation
import SwiftUI

struct NoteEditorScreen: View {
    @FocusState private var focused: Bool
    
    @State private var text: String = ""
    
    @StateObject private var viewModel: NoteEditorViewModel
    
    init(noteId: String? = nil, dependencies: Dependencies) {
        _viewModel = StateObject(wrappedValue: NoteEditorViewModel(noteId: noteId, noteRepo: dependencies.noteRepo))
    }
    
    var body: some View {
        TextEditor(text: $text)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                let note = viewModel.uiState.note
                self.text = note.text
                self.focused = note.isEmpty
            })
            .focused($focused, equals: true)
            .onChange(of: text) {
                viewModel.updateNote(text: text)
            }
            .autocorrectionDisabled()
            .textInputAutocapitalization(.none)
    }
}

struct NoteEditorScreenPreview: PreviewProvider {
    static var previews: some View {
        NoteEditorScreen(dependencies: Dependencies())
            .environmentObject(Dependencies())
    }
}
