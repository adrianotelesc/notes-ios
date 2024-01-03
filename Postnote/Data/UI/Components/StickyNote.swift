//
//  StickyNote.swift
//  Notes
//
//  Created by Adriano Teles on 03/01/24.
//

import SwiftUI

struct StickyNote: View {
    var text: String = ""
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .lineLimit(10)
            .truncationMode(.tail)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding(16)
            .background(Color(uiColor: .secondarySystemBackground))
            .cornerRadius(8)
    }
}

struct StickyNotePreview: PreviewProvider {
    static var previews: some View {
        StickyNote(text: "Note here")
    }
}
