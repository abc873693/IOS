//
//  ViewController.swift
//  URLSession
//
//  Created by Mac mini 301 on 2016/12/1.
//  Copyright © 2016年 Mac mini 301. All rights reserved.
//

import UIKit

class ViewController: UIViewController,URLSessionDataDelegate {
    @IBOutlet weak var response: UILabel!

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func connect(_ sender:UIButton){
        self.response.text = ""
        let url = URL(string:"http://httpbin.org/get")
        /*let conf = URLSessionConfiguration.default
        let session = URLSession(configuration:conf)
        let dataTask = session.dataTask(with: url! as URL){
            data,response,error in
            guard error == nil else{
                print("error:\(error)")
                return
            }
            let dataString = String(data:data!,encoding:.utf8)
            self.response.text = dataString
            self.indicator.stopAnimating()
        }*/
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        let dataTask = session.dataTask(with:url!)
        dataTask.resume()
        self.indicator.startAnimating()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        self.response.text = String(data:data,encoding:.utf8)
        self.indicator.stopAnimating()
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print("error:\(error)")
        self.indicator.stopAnimating()
    }
}

