//
//  CoreDataManager.swift
//  core data Sample
//
//  Created by Tony Gao on 30/10/18.
//  Copyright © 2018 Tony Gao. All rights reserved.
//

import CoreData

struct CoreDataManager {
    static let shared = CoreDataManager() // will live forever as long as application is still alive, it's propertities will too
    
    let persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "CoreDataTrainingModel")
        
        container.loadPersistentStores { (storeDescription, err) in
            if let err = err {
                fatalError("Loading of store failed: \(err)")
            }
        }
        return container
    }()
    
}

