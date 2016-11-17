//
//  DetailViewController.swift
//  simpleTable2
//
//  Created by Mac mini 301 on 2016/11/10.
//  Copyright © 2016年 Lab301. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var picture :UIImageView!
    var restaurant:Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picture.image = UIImage(named:restaurant.image!)
        //context.text = restaurant.type
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailViewCell
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = restaurant.name!
        case 1:
            cell.fieldLabel.text = "type"
            cell.valueLabel.text = restaurant.type!
        case 2:
            cell.fieldLabel.text = "location"
            cell.valueLabel.text = restaurant.location!
        case 3:
            cell.fieldLabel.text = "isVisited"
            cell.valueLabel.text = (restaurant.isVisited!) ?"Yes":"No"
        default:
            cell.fieldLabel.text = "Default"
            cell.valueLabel.text = "Default"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
