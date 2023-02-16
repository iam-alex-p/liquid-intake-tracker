//
//  PersistentStore.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/11/23.
//

import Foundation
import CoreData

struct PersistentStore {
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "LiquidIntakeTracker")
        
        container.loadPersistentStores(completionHandler: { storeDescription, error in
            if let error = error as? NSError {
                fatalError("Unable to initialize Core Data \(error.localizedDescription), \(error.userInfo)")
            }
        })
    }
    
    var context: NSManagedObjectContext { container.viewContext }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch let error as NSError {
                NSLog("Unable to save Core Data Context: \(error.localizedDescription), \(error.userInfo)")
            }
        }
    }
}
