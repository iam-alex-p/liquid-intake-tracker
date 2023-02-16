//
//  LITSettingsViewModel.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/11/23.
//

import Foundation

final class LITSettingsViewModel: ObservableObject {
    @Published var userInfo = UserDefaultsHelper<UserInfo>.getUserDefaults(for: "userInfo") ?? UserInfo()
    @Published var settings = UserDefaultsHelper<Settings>.getUserDefaults(for: "settings") ?? Settings()
    
    var totalLiquidIntake: Double {
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
    
    func convertUserWeight(_ units: Settings.WeightUnits) {
        userInfo.weight = units == .lb ? userInfo.weight.kgToLb : userInfo.weight.kg
    }
    
    func saveSettings() async {
        UserDefaultsHelper.saveUserDefaults(obj: settings, for: "settings")
        UserDefaultsHelper.saveUserDefaults(obj: userInfo, for: "userInfo")
    }
}
