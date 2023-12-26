//
//  NotesScreen.swift
//  Notes
//
//  Created by Adriano Teles on 28/09/23.
//

import SwiftUI
import SwiftUIMasonry

struct NotesScreen: View {
    @EnvironmentObject private var dependencies: Dependencies
    
    @StateObject private var viewModel: NotesViewModel

    init(dependencies: Dependencies) {
        _viewModel = StateObject(wrappedValue: NotesViewModel(noteRepo: dependencies.noteRepo))
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VMasonry(columns: 2, spacing: 8) {
                    ForEach(viewModel.uiState.notes, id: \.id) { note in
                        NavigationLink(destination: NoteEditingScreen(noteId: note.id, dependencies: dependencies)) {
                            Text(note.text)
                                .lineLimit(10)
                                .truncationMode(.tail)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .padding(16)
                                .background(Color(uiColor: .secondarySystemBackground))
                                .cornerRadius(8)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(16)
            }
            .navigationTitle("Notes")
            .toolbar {
                let noteCount = viewModel.uiState.notes.count
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
                        NavigationLink(destination: NoteEditingScreen(dependencies: dependencies)) {
                            Image(systemName: "square.and.pencil").imageScale(.large)
                        }
                    }
                }
            }
        }
        
    }
}
