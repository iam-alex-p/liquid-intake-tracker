//
//  DataManager.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/12/23.
//

import Foundation
import CoreData
import OrderedCollections

class DataManager: NSObject, ObservableObject {
    static let shared = DataManager()
    
    @Published var liquidIntakeEntries: OrderedDictionary<UUID, LiquidIntake> = [:]
    
    var liquidIntakeArray: [LiquidIntake] {
        Array(liquidIntakeEntries.values)
    }
    
    fileprivate var managedObjectContext: NSManagedObjectContext
    private let liquidIntakeEntriesFRC: NSFetchedResultsController<LiquidIntakeMO>
    
    private override init() {
        let persistentStore = PersistentStore()
        self.managedObjectContext = persistentStore.context
        
        let liquidIntakeFR: NSFetchRequest<LiquidIntakeMO> = LiquidIntakeMO.fetchRequest()
        liquidIntakeFR.sortDescriptors = [NSSortDescriptor(key: "dateTime", ascending: false)]
        
        liquidIntakeEntriesFRC = NSFetchedResultsController(fetchRequest: liquidIntakeFR
                                                            , managedObjectContext: managedObjectContext
                                                            , sectionNameKeyPath: nil
                                                            , cacheName: nil)
        
        super.init()
        
        // Initial fetch to populate intake array
        liquidIntakeEntriesFRC.delegate = self
        try? liquidIntakeEntriesFRC.performFetch()
        if let newLiquidIntake = liquidIntakeEntriesFRC.fetchedObjects {
            self.liquidIntakeEntries = OrderedDictionary(uniqueKeysWithValues: newLiquidIntake.map { ($0.id!, LiquidIntake(liquidIntakeMO: $0)) })
        }
    }
    
    func addLiquidIntakeEntry(type: String, volumeOz: Double, dateTime: Date) {
        let liquidIntake = LiquidIntakeMO(context: self.managedObjectContext)
        liquidIntake.id = UUID()
        liquidIntake.type = type
        liquidIntake.volumeOz = volumeOz
        liquidIntake.dateTime = dateTime
        
        saveData()
    }
    
    func saveData() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch let error as NSError {
                NSLog("Unresolved error saving context: \(error), \(error.userInfo)")
            }
        }
    }
}

extension DataManager: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        if let newLiquidIntake = controller.fetchedObjects as? [LiquidIntakeMO] {
            self.liquidIntakeEntries = OrderedDictionary(uniqueKeysWithValues: newLiquidIntake.map { ($0.id!, LiquidIntake(liquidIntakeMO: $0)) })
        }
    }
}
