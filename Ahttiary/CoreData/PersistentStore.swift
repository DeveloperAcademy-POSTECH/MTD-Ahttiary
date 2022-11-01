//
//  PersistentStore.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/11.
//

import Foundation
import CoreData

final class PersistentStore: ObservableObject {
    
    private(set) static var shared = PersistentStore()
    
    private init() { }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Ahttiary")
        
        guard let PersistentContainerDescriptions = container.persistentStoreDescriptions.first else {
            fatalError("\(#function): Failed to retrieve a persistent store description.")
        }
        
        PersistentContainerDescriptions.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)
        PersistentContainerDescriptions.setOption(true as NSNumber, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved loadPersistentStores error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext { persistentContainer.viewContext }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch let error as NSError {
                NSLog("Unresolved error saving context: \(error), \(error.userInfo)")
            }
        }
    }
}
