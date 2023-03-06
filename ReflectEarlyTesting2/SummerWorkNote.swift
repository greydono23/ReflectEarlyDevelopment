//
//  SummerWorkNote.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/5/23.
//

import FirebaseFirestoreSwift
import Foundation

struct WorkExperienceNote: Identifiable, Codable {
    @DocumentID var id: String?
    var noteName: String
    var employer: String
    var description: String
    var keyDetail: String
    var revelation: String
    var freeThought: String
    var userId: String?
}
