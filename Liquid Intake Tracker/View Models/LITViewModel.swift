//
//  LITViewModel.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/8/23.
//

import Foundation

final class LITViewModel: ObservableObject {
    @Published var userInfo = UserInfo()
    @Published var settings = Settings()
    
    var liquidIntake: Double {
        let weight = settings.weightUnits == .lb ? userInfo.weight.kg : userInfo.weight
        
        let intake = (weight * Double(UserInfo.calculateAge(birthDate: userInfo.dob))) / 28.3
        
        switch settings.volumeUnits {
        case .cups:
            return intake.cup
        case .l:
            return intake.l
        default:
            return intake
        }
    }
}
