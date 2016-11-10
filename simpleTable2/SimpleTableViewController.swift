//
//  SimpleTableViewController.swift
//  simpleTable2
//
//  Created by Lab301 on 2016/11/3.
//  Copyright © 2016年 Lab301. All rights reserved.
//

import UIKit

class SimpleTableViewController: UITableViewController {

    private var data = ["DB1","DB2","DB3","DB4","DB5"
                        ,"DB6","DB7","DB8","DB9","DB10"
                        ,"DB11","DB12","DB13","DB14","DB15"
                        ,"DB16","DB17","DB18","DB19","DB20"]
    private var data_image = ["001","002","003","004","005","006","007","008","009","010"]
    private var data_visited = [Bool](repeating:false ,count:20)
    override var prefersStatusBarHidden: Bool {return true}
    
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

        cell.title!.text = data[indexPath.row]
        cell.content!.text = "<--DB2"
        cell.picture!.image = UIImage(named:data_image[indexPath.row%10])
        if data_visited[indexPath.row]{
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        cell.layer.cornerRadius = 30
        cell.clipsToBounds = true
        //cell.backgroundColor = UIColor.lightGray
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let optionMenu = UIAlertController(title:"DB2",message:"你是方建任？",preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title:"Cancel",style: .cancel,handler:{(alert:UIAlertAction!) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .none
            self.data_visited[indexPath.row] = false
        })
        let okAction = UIAlertAction(title:"OK",style: .default,handler:{(alert:UIAlertAction!) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            self.data_visited[indexPath.row] = true
            })
        optionMenu.addAction(cancelAction)
        optionMenu.addAction(okAction)
        self.present(optionMenu,animated: true,completion: nil)
        //tableView.deselectRow(at: indexPath, animated: true)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style:.default,title:"Share",handler:{(action,indexPath)->Void in
                let shareText = "I'm " + self.data[indexPath.row]
            if let shareImage = UIImage(named:self.data_image[indexPath.row%10]){
                let activityCotroller = UIActivityViewController(activityItems: [shareText,shareImage], applicationActivities: nil)
                self.present(activityCotroller,animated:true, completion: nil)
            }else{
                let activityCotroller = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
                self.present(activityCotroller,animated:true, completion: nil)
            }
            })
        let deleteAction = UITableViewRowAction(style:.default,title:"Delete",handler:{(action,indexPath)->Void in
            self.data.remove(at: indexPath.row)
            self.data_visited.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            })
        deleteAction.backgroundColor = UIColor.red
        shareAction.backgroundColor = UIColor.blue
        return [deleteAction,shareAction]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailView"{
            if let indexpath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! DetailViewController
                destinationController.imageName = data_image[indexpath.row%10]
            }
        }
        
    }
    
    /*func takeAction(alert:UIAlertAction) {
        print("怪我瞜？")
    }*/
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
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            data.remove(at: indexPath.row)
            data_visited.remove(at: indexPath.row)
        }//else if editingStyle == .share {
            
        //}
        else if editingStyle == .insert {
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
