//
//  ViewController.swift
//  RPS
//
//  Created by Mac mini 301 on 2016/11/17.
//  Copyright © 2016年 Mac mini 301. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var computerLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorButton: UIButton!
    @IBOutlet weak var rockButton: UIButton!
    
    enum Sign {
        case rock,paper,scissor
        
        
    }
    
    @IBAction func paper(_ sender: AnyObject) {
        
    }
    
    @IBAction func scissor(_ sender: AnyObject) {
        
    }
    
    @IBAction func rock(_ sender: AnyObject) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

