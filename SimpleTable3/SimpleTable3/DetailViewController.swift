//
//  DetailViewController.swift
//  SimpleTable3
//
//  Created by Bob Chen on 2016/11/10.
//  Copyright © 2016年 Omomys Technology Inc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var picture: UIImageView!
    var imageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        picture.image = UIImage(named: imageName)
    }
}
