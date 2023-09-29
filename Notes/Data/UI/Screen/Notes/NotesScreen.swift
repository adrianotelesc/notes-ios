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
        List(viewModel.uiState.notes, id: \.text) {
            Text($0.text)
        }
    }
}
