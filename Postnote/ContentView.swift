//
//  ContentView.swift
//  Notes
//
//  Created by Adriano Teles on 26/12/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var dependencyContainer: DependencyContainer
    
    var body: some View {
        NotesView(dependencyContainer: dependencyContainer)
    }
}

struct ContentViewPreview: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DependencyContainer())
    }
}
