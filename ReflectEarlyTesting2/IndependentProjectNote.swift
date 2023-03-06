//
//  IndependentProjectNote.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/4/23.
//

import FirebaseFirestoreSwift
import Foundation

struct IndependentProjectNote: Identifiable, Codable {
    @DocumentID var id: String?
    var noteName: String
    var projectName: String
    var hours: Double
    var description: String
    var keyDetail: String
    var revelation: String
    var freeThought: String
    var userId: String?
}
