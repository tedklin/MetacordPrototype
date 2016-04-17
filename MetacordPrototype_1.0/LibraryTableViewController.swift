//
//  LibraryTableViewController.swift
//  MetacordPrototype_1.0
//
//  Created by Ted Lin on 4/10/16.
//  Copyright © 2016 Ted Lin. All rights reserved.
//

import UIKit

class LibraryTableViewController: UITableViewController {
    
    var detailViewController: DetailViewController? = nil
    var itemList = ["Rheumatic Heart Disease", "Coronary Heart Disease", "Heart stuffs", "Library Item 4", "Library Item 5", "Library Item 6", "Library Item 7"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "EKG Libary"

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destinationViewController as! DetailViewController
                controller.detailItem = itemList[indexPath.row]
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel!.text = itemList[indexPath.row]
        return cell
    }
    
}

