//
//  SongListTableViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Kary Martinez on 8/15/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class SongListTableViewController: UITableViewController {
    let Songs = Song.loveSongs
    

    @IBOutlet weak var searchBarOutlet: UISearchBar!
    
    var songSearchResults:[Song] {
        get {
            
            //when we have no search term, return the value of the initial set of people
            guard let searchString = searchString else {
                return Songs
            }
            guard searchString != ""  else {
                return Songs
            }
            switch searchBarOutlet.selectedScopeButtonIndex {
            //Scope "Song"
            case 0: return Songs.filter({$0.name.lowercased().contains(searchString.lowercased())})
                
                
            //Scope = "Artist"
            case 1: return Songs.filter({$0.artist.lowercased().contains(searchString.lowercased())})
                
            default:
                return Songs
            }
        }
    }
    
    var searchString: String? = nil {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarOutlet.delegate = self
        
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songSearchResults.count 
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "loveSongsCell", for: indexPath)
        cell.textLabel?.text = songSearchResults[indexPath.row].name
        // in the particular row that we're looking at look for, look in our model for  the object that is in that location and use that info
        cell.detailTextLabel?.text = songSearchResults[indexPath.row].artist
        return cell
    }
}

extension SongListTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchBar.text
    }
}


//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchString = searchBar.text
//    }
