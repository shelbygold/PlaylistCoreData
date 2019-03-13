//
//  PlaylistController.swift
//  PlaylistCoreDataa
//
//  Created by shelby gold on 3/13/19.
//  Copyright © 2019 shelby gold. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController{
    
    static var shared = PlaylistController()
    
    //source of truth MOC
    var playlists: [Playlist]{
        //grab playlist from the harddrive
        let request: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        //deal with throw
        return(try? CoreDataStack.context.fetch(request)) ?? []
    }
    //crud
    func add(playlistWithTitle name: String){
        Playlist(name: name)
        saveToPersistentStore()
        
    }
    //delete
    func delete(playlist: Playlist){
        CoreDataStack.context.delete(playlist)
        saveToPersistentStore()
    }
    
    
    //persistence
    func saveToPersistentStore(){
        do {
            try CoreDataStack.context.save()
        } catch  {
            print("there was an error saving to persistentStore \(#function) \(error)")
        }
    }
}
