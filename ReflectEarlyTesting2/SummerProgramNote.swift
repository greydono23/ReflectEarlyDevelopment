//
//  SummerProgramNote.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/5/23.
//

import FirebaseFirestoreSwift
import Foundation

struct SummerProgramNote: Identifiable, Codable {
    @DocumentID var id: String?
    var noteName: String
    var programName: String
    var hours: Double
    var weeks: Double
    var description: String
    var favorite: String
    var revelation: String
    var freeThought: String
    var userId: String?
}
