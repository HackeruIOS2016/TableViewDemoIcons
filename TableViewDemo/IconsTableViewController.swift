//
//  IconsTableViewController.swift
//  TableViewDemo
//
//  Created by HackerU on 14/04/2016.
//  Copyright © 2016 HackerU. All rights reserved.
//

import UIKit

class IconsTableViewController: UITableViewController {

    
   
    var icons = [[Icon]]()
 
    override func viewDidLoad() {
        super.viewDidLoad()

        icons.append(IconDataSource().summerSet())
        icons.append(IconDataSource().winterSet())
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        refreshControl?.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
    }
 
    func refresh(sender:UIRefreshControl){
        icons.removeAll()
        icons.append(IconDataSource().summerSet())
        icons.append(IconDataSource().winterSet())
        tableView.reloadData()
        
        sender.endRefreshing()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return icons.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return icons[section].count
    }


    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("summercellidentififer", forIndexPath: indexPath)
        
        let row = indexPath.row
        let section = indexPath.section
        
        // Configure the cell...
        
        let icon = icons[section][row]
        
        
        cell.imageView?.image = icon.image
        cell.textLabel?.text = icon.title
        cell.detailTextLabel?.text = icon.subtitle
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Summer" : "Winter"
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            
            let row = indexPath.row
            let section = indexPath.section
            icons[section].removeAtIndex(row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        
        //remove an icon from the fromIndexPath
        let row = fromIndexPath.row
        let section = fromIndexPath.section
        let iconToMove = icons[section].removeAtIndex(row)
        
        //add the icon back to the new indexPath
        let toRow = toIndexPath.row
        let toSection = toIndexPath.section
        
        icons[toSection].insert(iconToMove, atIndex: toRow)

    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
