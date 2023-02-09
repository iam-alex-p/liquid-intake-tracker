//
//  String+Ext.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/8/23.
//

import Foundation

extension Double {
    var rounded: String { String(format: "%.2f", self) }
    
    var oz: Double { self }
    var cup: Double { self / 8.0 }
    var l: Double { self / 33.814 }
    
    var lb: Double { self }
    var kg: Double { self / 2.205 }
}
