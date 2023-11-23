//
//  NoteEditingScreen.swift
//  Notes
//
//  Created by Adriano Teles on 23/11/23.
//

import Foundation
import SwiftUI

struct NoteEditingScreen: View {
    @FocusState private var focused: Bool?
    
    @State private var text: String = ""
    
    var body: some View {
        return TextEditor(text: $text)
            .navigationBarTitleDisplayMode(.inline)
            .focused($focused, equals: true)
            .onAppear(perform: {
                self.focused = true
            })
    }
}
