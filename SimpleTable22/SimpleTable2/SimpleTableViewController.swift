//
//  SimpleTableViewController.swift
//  SimpleTable2
//
//  Created by Bob Chen on 2016/11/3.
//  Copyright © 2016年 Omomys Technology Inc. All rights reserved.
//

import UIKit

class SimpleTableViewController: UITableViewController {

    
    private var data = ["dd1", "dd2", "dd3", "dd4", "dd5",
                        "dd6", "dd7", "dd8", "dd9", "dd10",
                        "dd11", "dd12", "dd13", "dd14", "dd15",
                        "dd16", "dd17", "dd18", "dd19", "dd20"]
    
    private var loc = ["kk1", "kk2", "kk3", "kk4", "kk5",
                        "kk6", "kk7", "kk8", "kk9", "kk10",
                        "kk11", "kk12", "kk13", "kk14", "kk15",
                        "kk16", "kk17", "kk18", "kk19", "kk20"]
    
    private var img = ["barrafina", "cafeloisl", "cafelore"]
    
    private var checked = [Bool](repeating: false, count:20)
    
    override var prefersStatusBarHidden: Bool { return true }
    
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
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SimpleTableViewCell

        cell.nameLabel!.text = data[indexPath.row]
        cell.locationLabel!.text = loc[indexPath.row]
        cell.thumbnail!.image = UIImage(named: img[indexPath.row % 3])
        cell.thumbnail2!.image = UIImage(named: img[indexPath.row % 3])
        
        if checked[indexPath.row] {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        //cell.layer.cornerRadius = 30
        //cell.clipsToBounds = true
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let optionMenu = UIAlertController(title: "Hey, you pick up a row", message: "What do you want to do?", preferredStyle: .alert)
        
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: { (alert: UIAlertAction!) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            self.checked[indexPath.row] = true
            tableView.deselectRow(at: indexPath, animated: false)
        })
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        optionMenu.addAction(cancelAction)
        optionMenu.addAction(okAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    /*
    func takeAction(alert: UIAlertAction!){
        print("Bingo")
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            data.remove(at: indexPath.row)
            loc.remove(at: indexPath.row)
            checked.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
