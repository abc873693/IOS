//
//  ViewController.swift
//  tableveiw
//
//  Created by Lab301 on 2016/10/20.
//  Copyright © 2016年 Lab301. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var data = ["Ray","Bob","Billy","Jay","Rcok","Zack","Ray","Bob","Billy","Jay","Rcok","Zack","Ray","Bob","Billy","Jay","Rcok","Zack","Ray","Bob","Billy","Jay","Rcok","Zack"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        //cell.imageView?.image = UIImage(name:"#imageLiteral(resourceName: "upstate")")
        return cell
    }
    
}

