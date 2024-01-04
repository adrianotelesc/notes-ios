//
//  NoteEditingScreen.swift
//  Notes
//
//  Created by Adriano Teles on 23/11/23.
//

import Foundation
import SwiftUI

struct NoteEditorView: View {
    @StateObject private var viewModel: ViewModel
    
    @FocusState private var focused: Bool
    
    init(noteId: String? = nil, dependencyContainer: DependencyContainer) {
        _viewModel = StateObject(wrappedValue: ViewModel(noteId: noteId, noteRepo: dependencyContainer.noteRepo))
    }
    
    var body: some View {
        TextEditor(text: $viewModel.text)
            .navigationBarTitleDisplayMode(.inline)
            .focused($focused)
            .onAppear(perform: {
                self.focused = viewModel.text.isEmpty
            })
            .autocorrectionDisabled()
            .textInputAutocapitalization(.none)
    }
}

struct NoteEditorViewPreview: PreviewProvider {
    static var previews: some View {
        NoteEditorView(dependencyContainer: DependencyContainer())
    }
}
