//
//  DetailViewController.swift
//  simpleTable2
//
//  Created by Mac mini 301 on 2016/11/10.
//  Copyright © 2016年 Lab301. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var picture :UIImageView!
    @IBOutlet weak var context: UILabel!
    var imageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picture.image = UIImage(named:imageName)
        context.text = imageName
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
