//
//  NSManagedObject.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/11.
//

import Foundation
import CoreData

extension NSManagedObject {
    
    // Container에 저장된 모든 Entity의 개수를 반환합니다.
    class func count(context: NSManagedObjectContext) -> Int {
        let fetchRequest: NSFetchRequest<Self> = NSFetchRequest<Self>(entityName: Self.description())
        
        do {
            let result = try context.count(for: fetchRequest)
            return result
        } catch let error as NSError {
            NSLog("Error counting NSManagedObjects \(Self.description()): \(error.localizedDescription), \(error.userInfo)")
        }
        
        return 0
    }
    
    // Container에 저장된 모든 Entity를 반환합니다.
    class func allObjects(context: NSManagedObjectContext) -> [NSManagedObject] {
        let fetchRequest: NSFetchRequest<Self> = NSFetchRequest<Self>(entityName: Self.description())
        
        do {
            let results = try context.fetch(fetchRequest)
            return results
        } catch let error as NSError {
            NSLog("Error fetching NSManagedObjects \(Self.description()): \(error.localizedDescription), \(error.userInfo)")
        }
        
        return []
    }
    
    // 특정 id 값을 가진 Entity를 반환합니다.
    class func object(id: UUID, context: NSManagedObjectContext) -> Self? {
        let fetchRequest: NSFetchRequest<Self> = NSFetchRequest<Self>(entityName: Self.description())
        
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        do {
            let results = try context.fetch(fetchRequest)
            return results.first
        } catch let error as NSError {
            NSLog("Error fetching NSManagedObjects \(Self.description()): \(error.localizedDescription), \(error.userInfo)")
        }
        
        return nil
    }
}
