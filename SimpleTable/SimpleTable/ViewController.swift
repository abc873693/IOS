//
//  ViewController.swift
//  SimpleTable
//
//  Created by Bob Chen on 2016/10/20.
//  Copyright © 2016年 Omomys Technology Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let data = ["kk1", "kk2", "kk3", "kk4", "kk5", "kk6", "kk7", "kk8", "kk9", "kk10", "kk11", "kk12", "kk13", "kk14", "kk15", "kk16", "kk17", "kk18", "kk19", "kk20", "kk21", "kk22", "kk23", "kk24", "kk25", "kk26"]

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
        
        //let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row];
        cell.imageView?.image = UIImage(named: "cafedeadend")
        return cell
    }

}

