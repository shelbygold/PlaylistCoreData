//
//  SongTableViewController.swift
//  PlaylistCoreDataa
//
//  Created by shelby gold on 3/13/19.
//  Copyright © 2019 shelby gold. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {
    
    var playlist: Playlist?
    @IBOutlet weak var songNameTextField: UITextField!
    @IBOutlet weak var artistNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = playlist?.name ?? "MyPlaylist"
        
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return playlist?.songs?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        
        guard let playlist = playlist else {return UITableViewCell()}
        if let song = playlist.songs?[indexPath.row] as? Song{
            cell.textLabel?.text = song.title
            cell.detailTextLabel?.text = song.artist
            
        }
        return cell
        
        
    }
    
    @IBAction func addSongButtonTapped(_ sender: Any) {
        guard let title = songNameTextField.text,
            let artist = artistNameTextField.text,
            let playlist = playlist else {return}
        SongController.create(songWithName: title, artist: artist, playlist: playlist)
        songNameTextField.text = ""
        artistNameTextField.text = ""
        tableView.reloadData()
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let playlist = playlist else {return}
            guard let song = playlist.songs?[indexPath.row] as? Song else {return}
            SongController.delete(song: song)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        
    }
}
