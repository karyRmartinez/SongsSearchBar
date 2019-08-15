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
    
    @IBOutlet weak var songSearchBar: UISearchBar!
    
    var songSearchResults:[Song] {
        get {
            
            //when we have no search term, return the value of the initial set of people
            guard let searchString = searchString else {
                return Songs
            }
            guard searchString != ""  else {
                return Songs
            }
            if let scopeTitles = songSearchBar.scopeButtonTitles {
                let currentScopeIndex = UISearchBarStyle.selectedScopeButtonIndex
                switch scopeTitles[currentScopeIndex] {
                case "song":
                    return Songs.filter{$0.name.contains(searchString.lowercased())}
                case "Artist":
                    return Songs
                    return Songs                }
            }
            return Songs
        }
    }
    
    var searchString: String? = nil {
        didSet {
            print(searchString)
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Songs.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "loveSongs", for: indexPath) as? SongInfoTableViewCell {  cell.Song?.text = songSearchResults[indexPath.row].Song
            // in the particular row that we're looking at look for, look in our model for  the object that is in that location and use that info
        cell.Artist?.text = songSearchResults[indexPath.row].artist
            return cell
            
            
        }
    

        // Configure the cell...

        return UITableViewCell()
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension SongListTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchBar.text
    }
    //    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    //        searchString = searchBar.text
    //    }
}
