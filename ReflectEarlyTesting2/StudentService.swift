//
//  StudentService.swift
//  ReflectEarlyTesting2
//
//  Created by Artemas on 3/13/23.
//

import Foundation
import Firebase

class StudentService: ObservableObject {
    
    static let studentService: StudentService = StudentService()
    
    @Published var student: StudentModel? {
        didSet {
            do {
                try Firestore.firestore().collection("students").document(Auth.auth().currentUser?.uid ?? "").setData(from: student)
            } catch let error {
                print("Error writing city to Firestore: \(error)")
            }
        }
    }
        
    func setup() {
        Firestore.firestore().collection("students").document(Auth.auth().currentUser?.uid ?? "")
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                let source = document.metadata.hasPendingWrites ? "Local" : "Server"
                if source == "Server" {
                    try? self.student = document.data(as: StudentModel.self)
                }
            }
    }
}

struct StudentModel: Codable {
    var name: String
    var organizations: [String]
    var grade: Int
    var school: String
}
