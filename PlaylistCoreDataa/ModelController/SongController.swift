//
//  SongController.swift
//  PlaylistCoreDataa
//
//  Created by shelby gold on 3/13/19.
//  Copyright © 2019 shelby gold. All rights reserved.
//

import Foundation

class SongController{
    
    static func create(songWithName title: String, artist: String, playlist: Playlist){
        Song(title: title, artist: artist, playlist: playlist)
        PlaylistController.shared.saveToPersistentStore()
    }
    static func delete(song: Song){
    CoreDataStack.context.delete(song)
        PlaylistController.shared.saveToPersistentStore()
}
}
