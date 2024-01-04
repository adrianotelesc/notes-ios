//
//  NotesScreen.swift
//  Notes
//
//  Created by Adriano Teles on 28/09/23.
//

import SwiftUI
import SwiftUIMasonry

struct NotesView: View {
    @StateObject private var viewModel: ViewModel
    
    private var dependencyContainer: DependencyContainer

    init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
        
        _viewModel = StateObject(wrappedValue: ViewModel(noteRepo: dependencyContainer.noteRepo))
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VMasonry(columns: 2, spacing: 8) {
                    ForEach(viewModel.notes, id: \.id) { note in
                        NavigationLink(destination: NoteEditorView(noteId: note.id, dependencyContainer: dependencyContainer)) {
                            StickyNoteView(text: note.text)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(16)
            }
            .navigationTitle("Notes")
            .toolbar {
                let noteCount = viewModel.notes.count
                let text = if (noteCount > 0) {
                    String(AttributedString(localized: "^[\(noteCount) Note](inflect: true)").characters)
                } else {
                    "No Notes"
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    HStack {
                        Spacer()
                        Text(text)
                            .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                        Spacer()
                        NavigationLink(destination: NoteEditorView(dependencyContainer: dependencyContainer)) {
                            Image(systemName: "square.and.pencil").imageScale(.large)
                        }
                    }
                }
            }
        }
        
    }
}

struct NotesViewPreview: PreviewProvider {
    static var previews: some View {
        NotesView(dependencyContainer: DependencyContainer())
    }
}
