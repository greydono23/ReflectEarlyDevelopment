//
//  SchoolWorkNote.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/1/23.
//

import FirebaseFirestoreSwift
import Foundation

struct SchoolWorkNote: Identifiable, Codable {
    @DocumentID var id: String?
    var noteName: String
    var className: String
    var description: String
    var keyDetail: String
    var revelation: String
    var freeThought: String
    var userId: String?
}
