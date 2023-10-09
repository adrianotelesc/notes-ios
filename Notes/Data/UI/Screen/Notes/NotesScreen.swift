//
//  NotesScreen.swift
//  Notes
//
//  Created by Adriano Teles on 28/09/23.
//

import SwiftUI

struct NotesScreen: View {
    @ObservedObject var viewModel = NotesViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.uiState.notes, id: \.text) {
                Text($0.text)
            }
            .toolbar {
                Button(action: {viewModel.addNote()}) {
                    Image(systemName: "plus").imageScale(.large)
                }
            }
        }
        
    }
}
