//
//  Note.swift
//  Notes
//
//  Created by Adriano Teles on 28/09/23.
//

import Foundation

struct Note: Equatable {
    let id: String
    let text: String
    
    init(id: String = UUID().uuidString, text: String = "") {
        self.id = id
        self.text = text
    }
    
    var isEmpty: Bool {
        return text.replacingOccurrences(of: "\\s+", with: "", options: .regularExpression, range: nil).isEmpty
    }
    
    var isNotEmpty: Bool {
        return !isEmpty
    }
}
