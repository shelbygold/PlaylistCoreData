//
//  playlistConvience.swift
//  PlaylistCoreDataa
//
//  Created by shelby gold on 3/13/19.
//  Copyright © 2019 shelby gold. All rights reserved.
//

import Foundation
import CoreData

extension Playlist{
    @discardableResult
    convenience init(name: String, songs: [Song] = [], context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context: context)
        self.name = name
        
    }
}
