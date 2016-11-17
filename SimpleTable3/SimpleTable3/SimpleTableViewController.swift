//
//  SimpleTableViewController.swift
//  SimpleTable3
//
//  Created by Bob Chen on 2016/11/10.
//  Copyright © 2016年 Omomys Technology Inc. All rights reserved.
//

import UIKit

class SimpleTableViewController: UITableViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SimpleTableViewCell
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.ageLabel.text = restaurants[indexPath.row].type
        cell.thumbnail.image = UIImage(named: restaurants[indexPath.row].image!)
        //cell.thumbnail.layer.cornerRadius = 30
        //cell.thumbnail.clipsToBounds = true
        if restaurants[indexPath.row].isVisited! {
            cell.accessoryType = .checkmark
        }else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let actionMenu = UIAlertController(title: nil, message: "Choose an action", preferredStyle: .actionSheet)
        
        let checkAction = UIAlertAction(title: "Check", style: .default, handler: {(action: UIAlertAction) -> Void in
                let cell = tableView.cellForRow(at: indexPath)
                restaurants[indexPath.row].isVisited = true
                cell?.accessoryType = .checkmark
            })
        
        let disclosureIndicatorAction = UIAlertAction(title: "DisClosure Indicator", style: .default, handler: {(action: UIAlertAction) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .disclosureIndicator
        })
        
        let detailButtonAction = UIAlertAction(title: "Detail Button", style: .default, handler: {(action: UIAlertAction) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .detailButton
        })
        
        let detailDisclosureButtonAction = UIAlertAction(title: "Detail Disclosure Button", style: .destructive, handler: {(action: UIAlertAction) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .detailDisclosureButton
        })

        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            restaurants[indexPath.row].isVisited = false
            cell?.accessoryType = .none
        })
        
        actionMenu.addAction(detailButtonAction)
        actionMenu.addAction(checkAction)
        actionMenu.addAction(detailDisclosureButtonAction)
        actionMenu.addAction(disclosureIndicatorAction)
        actionMenu.addAction(cancelAction)
        self.present(actionMenu, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let shareAction = UITableViewRowAction(style: .default, title: "Share", handler:{(action, indexPath) -> Void in
                let shareText = "Just checking in at " + restaurants[indexPath.row].name!
            if let shareImage = UIImage(named: restaurants[indexPath.row].image!){
                let activityController = UIActivityViewController(activityItems: [shareText, shareImage], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }  else {
                let activityController = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        })
        
        let deletAction = UITableViewRowAction(style: .default, title: "Delete", handler: {(action, indexPath) -> Void in
                restaurants.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .fade)
        })
        
        shareAction.backgroundColor = UIColor(red: 23.0/255.0, green: 200.0/255.0, blue: 120.0/255.0, alpha: 0.5)
        deletAction.backgroundColor = UIColor.red
        
        return [deletAction, shareAction ]
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailView" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! DetailViewController
                destinationController.imageName = restaurants[indexPath.row].image!
            }
        }
            
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    /*override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            name.remove(at: indexPath.row)
            age.remove(at: indexPath.row)
            visited.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }*/
    

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
