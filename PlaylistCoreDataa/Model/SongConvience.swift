//
//  SongConvience.swift
//  PlaylistCoreDataa
//
//  Created by shelby gold on 3/13/19.
//  Copyright © 2019 shelby gold. All rights reserved.
//

import Foundation
import CoreData
extension Song{
    @discardableResult
    convenience init(title: String, artist: String, playlist: Playlist, context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context: context)
        self.title = title
        self.artist = artist
        self.playlist = playlist
    }
}
