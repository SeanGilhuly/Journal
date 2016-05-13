//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Sean Gilhuly on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    // MARK: - Table view data source
    // MARK: How many rows are being returned?

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return EntryController.sharedController.entries.count
    
    }

    // MARK: UITableViewDataSource - Dequeue Reusable "reuseIdentifier"
    // MARK: Atributes Inspector Identifier
    // MARK: This is what lets you re-use the cell
    // MARK: Set up your cells to display the title of the entry
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entryCell", forIndexPath: indexPath)

        let enteredInformation = EntryController.sharedController.entries[indexPath.row]
        
        cell.textLabel?.text = enteredInformation.title

        return cell
    }


    // MARK:  This allows a user to swipe to delete row
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {

        let removeSpecificRow = EntryController.sharedController.entries[indexPath.row]
            
        EntryController.sharedController.removeEntry(removeSpecificRow)
            
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        }
    }


  
    // MARK: - Prepare for Segue
    // MARK:  You need to use the segue when they are passing an entry on the cell to the view controller
    // You do not need it for the "+" button because it is not passing information, just going to the next ViewController
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editEntry" {
            
            //Make the "let" similiar to the actual view controller name
            if let entryDetailViewController = segue.destinationViewController as? EntryDetailViewController {
                if let entryCell = sender as? UITableViewCell {
                    if let indexPath = tableView.indexPathForCell(entryCell) {
                        let entry = EntryController.sharedController.entries[indexPath.row]
                        entryDetailViewController.entry = entry
                    }
                }
            }
        }
    }
}
                
                