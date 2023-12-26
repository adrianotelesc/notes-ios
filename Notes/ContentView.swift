//
//  ContentView.swift
//  Notes
//
//  Created by Adriano Teles on 26/12/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var dependencies: Dependencies
    
    var body: some View {
        NotesScreen(dependencies: dependencies)
    }
}

struct ContentViewPreview: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Dependencies())
    }
}
