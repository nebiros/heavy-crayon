//
//  MockNSManagedObjectContext.swift
//  HeavyCrayon
//
//  Created by Juan Felipe Alvarez Saldarriaga on 7/30/16.
//  Copyright © 2016 Juan Felipe Alvarez Saldarriaga. All rights reserved.
//

import Foundation
import CoreData

class MockNSManagedObjectContext: NSManagedObjectContext {
  
  class func setUpInMemoryManagedObjectContext() -> MockNSManagedObjectContext {
    let managedObjectModel = NSManagedObjectModel.mergedModelFromBundles([NSBundle.mainBundle()])!
    
    let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
    
    do {
      try persistentStoreCoordinator.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil)
    } catch {
      fatalError("Adding in-memory persistent store failed")
    }
    
    let managedObjectContext = MockNSManagedObjectContext()
    managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
    
    return managedObjectContext
  }
}
