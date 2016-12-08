//
//  ViewController.swift
//  firebasedemo
//
//  Created by Mac mini 301 on 2016/12/8.
//  Copyright © 2016年 KUAS. All rights reserved.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var indicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        FIRApp.configure()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(_ sender: Any) {
        indicator.isHidden = false
        indicator.startAnimating()
        
    }
    
    @IBAction func logout(_ sender: Any) {
        indicator.isHidden = false
        indicator.startAnimating()
        FIRAuth.auth()?.createUser(withEmail: username.text!, password: password.text!) { (user, error) in
            if user?.email != nil {
                let quetion = UIAlertController(title: "firebase", message: "創建成功", preferredStyle: .alert);
                //新增選項
                let OKaction = UIAlertAction(title: "好", style: .default , handler:nil);
                //把選項加到UIAlertController
                quetion.addAction(OKaction);
                //Show
                self.present(quetion, animated: true, completion: nil);
            }
            else {
                let quetion = UIAlertController(title: "firebase", message: "創建失敗", preferredStyle: .alert);
                //新增選項
                let OKaction = UIAlertAction(title: "好", style: .default , handler:nil);
                //把選項加到UIAlertController
                quetion.addAction(OKaction);
                //Show
                self.present(quetion, animated: true, completion: nil);
            }
        }
    }
    
    
}

