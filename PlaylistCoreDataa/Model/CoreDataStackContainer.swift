//
//  CoreDataStackContainer.swift
//  PlaylistCoreDataa
//
//  Created by shelby gold on 3/13/19.
//  Copyright © 2019 shelby gold. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack{
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PlaylistCoreDataa")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error{
                fatalError("failed to load persistent store \(error)")
            }
        })
        return container
    }()
    static var context: NSManagedObjectContext{
        return container.viewContext
    }
}
