//
//  PlaylistTableViewController.swift
//  PlaylistCoreDataa
//
//  Created by shelby gold on 3/13/19.
//  Copyright © 2019 shelby gold. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {
    
    @IBOutlet weak var playlistTitleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlaylistController.shared.playlists.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
        let playlist = PlaylistController.shared.playlists[indexPath.row]
        cell.textLabel?.text = playlist.name
        cell.detailTextLabel?.text = "\(playlist.songs?.count ?? 0) Songs"
        return cell
    }
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let playlist = PlaylistController.shared.playlists[indexPath.row]
            PlaylistController.shared.delete(playlist: playlist)
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "songVC", let indePath = tableView.indexPathForSelectedRow {
            let playlist = PlaylistController.shared.playlists[indePath.row]
            let songVC = segue.destination as? SongTableViewController
            songVC?.playlist = playlist
        }
        
        
    }
    
    @IBAction func playlistAddButtonTapped(_ sender: Any) {
        guard let name = playlistTitleTextField.text else {return}
        PlaylistController.shared.add(playlistWithTitle: name)
        tableView.reloadData()
    }
    
}




