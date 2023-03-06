//
//  AccountViewModel.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/2/23.
//

import Combine
import Foundation

class AccountViewModel: ObservableObject {
    
    @Published var schoolWorkNoteViewModels: [SchoolWorkNoteViewModel] = []
    @Published var communityServiceNoteViewModels: [CommunityServiceNoteViewModel] = []
    @Published var independentProjectNoteViewModels: [IndependentProjectNoteViewModel] = []
    @Published var summerProgramNoteViewModels: [SummerProgramNoteViewModel] = []
    @Published var workExperienceNoteViewModels: [WorkExperienceNoteViewModel] = []
    @Published var generalNoteViewModels: [GeneralNoteViewModel] = []
    
    @Published var schoolWorkNoteRepository = SchoolWorkRepository()
    @Published var communityServiceNoteRepository = CommunityServiceRepository()
    @Published var independentProjectNoteRepository = IndependentProjectRepository()
    @Published var summerProgramNoteRepository = SummerProgramRepository()
    @Published var workExperienceNoteRepository = WorkExperienceRepository()
    @Published var generalNoteRepository = GeneralRepository()
    
    private var cancellables: Set<AnyCancellable> = []

    init() {
        schoolWorkNoteRepository.$schoolWorkNotes.map { notes in
            notes.map(SchoolWorkNoteViewModel.init)
        }
        .assign(to: \.schoolWorkNoteViewModels, on: self)
        .store(in: &cancellables)
        
        communityServiceNoteRepository.$communityServiceNotes.map { notes in
            notes.map(CommunityServiceNoteViewModel.init)
        }
        .assign(to: \.communityServiceNoteViewModels, on: self)
        .store(in: &cancellables)
        
        independentProjectNoteRepository.$independentProjectNotes.map { notes in
            notes.map(IndependentProjectNoteViewModel.init)
        }
        .assign(to: \.independentProjectNoteViewModels, on: self)
        .store(in: &cancellables)
        
        summerProgramNoteRepository.$summerProgramNotes.map { notes in
            notes.map(SummerProgramNoteViewModel.init)
        }
        .assign(to: \.summerProgramNoteViewModels, on: self)
        .store(in: &cancellables)
        
        workExperienceNoteRepository.$workExperienceNotes.map { notes in
            notes.map(WorkExperienceNoteViewModel.init)
        }
        .assign(to: \.workExperienceNoteViewModels, on: self)
        .store(in: &cancellables)
        
        generalNoteRepository.$generalNotes.map { notes in
            notes.map(GeneralNoteViewModel.init)
        }
        .assign(to: \.generalNoteViewModels, on: self)
        .store(in: &cancellables)
    }
    
    func addSchoolWorkNote(_ note: SchoolWorkNoteModel) {
        schoolWorkNoteRepository.add(note)
    }
    
    func addCommunityServiceNote(_ note: CommunityServiceNote) {
        communityServiceNoteRepository.add(note)
    }
    
    func addIndependentProjectNote(_ note: IndependentProjectNote) {
        independentProjectNoteRepository.add(note)
    }
    
    func addSummerProgramNote(_ note: SummerProgramModel) {
        summerProgramNoteRepository.add(note)
    }
    
    func addWorkExperienceNote(_ note: WorkExperienceNote) {
        workExperienceNoteRepository.add(note)
    }
    
    func addGeneralNote(_ note: GeneralNote) {
        generalNoteRepository.add(note)
    }
}
