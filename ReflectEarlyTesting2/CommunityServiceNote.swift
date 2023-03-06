//
//  CommunityServiceNote.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/4/23.
//

import FirebaseFirestoreSwift
import Foundation

struct CommunityServiceNote: Identifiable, Codable {
    @DocumentID var id: String?
    var noteName: String
    var organization: String
    var hours: Double
    var description: String
    var keyDetail: String
    var revelation: String
    var freeThought: String
    var userId: String?
}
