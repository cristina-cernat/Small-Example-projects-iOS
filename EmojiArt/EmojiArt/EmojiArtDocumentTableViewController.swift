//
//  EmojiArtDocumentTableViewController.swift
//  EmojiArt
//
//  Created by Cristina Mihaela on 07.03.2022.
//

import UIKit

class EmojiArtDocumentTableViewController: UITableViewController {

    var emojiArtDocuments = ["One", "Two", "Three"]

    // MARK: - UITableViewDataSource methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return emojiArtDocuments.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Reusable cell if possible
        let cell = tableView.dequeueReusableCell(withIdentifier: "DocumentCell", for: indexPath)

        // Setup the cell's content
        cell.textLabel?.text = emojiArtDocuments[indexPath.row]

        // Return the cell
        return cell
    }



    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }



    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Delete
               if editingStyle == .delete {
                   // Update model (delete record)
                   emojiArtDocuments.remove(at: indexPath.row)

                   // Delete the row from the data source
                   tableView.deleteRows(at: [indexPath], with: .fade)
               }    }


    // Add a new document with an auto-generated name
    @IBAction func newEmojiArt(_ sender: UIBarButtonItem) {
        // Add a new document to the model (with auto-generated name)
        emojiArtDocuments.append("Document".madeUnique(withRespectTo: emojiArtDocuments))

        // Reload tableView
        tableView.reloadData()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if splitViewController?.preferredDisplayMode != .oneOverSecondary {
            splitViewController?.preferredDisplayMode = .oneOverSecondary
        }
    }

}
