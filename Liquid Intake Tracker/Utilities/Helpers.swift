//
//  Helpers.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/11/23.
//

import Foundation

struct UserDefaultsHelper<T: Codable> {
    static func saveUserDefaults(obj: T, for key: String) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(obj), forKey: key)
    }
    
    static func getUserDefaults(for key: String) -> T? {
        guard let data = UserDefaults.standard.value(forKey: key) as? Data else {
            return nil
        }
        
        return try? PropertyListDecoder().decode(T.self, from: data)
    }
}
