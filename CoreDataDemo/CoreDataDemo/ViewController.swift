//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Mac mini 301 on 2016/11/24.
//  Copyright © 2016年 Mac mini 301. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var txt_name: UITextField!
    @IBOutlet weak var txt_gender: UITextField!
    @IBOutlet weak var txt_age: UITextField!
    @IBOutlet weak var btn_add: UIButton!
    @IBOutlet weak var mtableView: UITableView!
    var people:[NSManagedObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        mtableView.delegate = self
        mtableView.dataSource = self
        }
    func tableView(tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! ContentCell
        cell.neme.text = people[indexPath.row].name
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("WebSegue", sender: indexPath)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    @IBAction func add_action(_ sender: Any) {
        let context = getContext()
        let cdEntity = NSEntityDescription.entity(forEntityName: "Context", in: context)
        let cdObj = NSManagedObject(entity:cdEntity!,insertInto:context)
        cdObj.setValue(txt_name.text, forKey: "name")
        cdObj.setValue(txt_age.text, forKey: "age")
        cdObj.setValue(txt_gender.text, forKey: "gender")
        let interVal = TimeInterval(234525)
        let date = NSDate(timeIntervalSince1970: interVal)
        cdObj.setValue(date, forKey: "date")
        do{
            try context.save()
            print("save success!!")
        }catch{
            print("Error: \(error)")
        }

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ContentCell
        cell.title.text = restaurants[indexPath.row].name
        cell.content.text = restaurants[indexPath.row].type
        cell.picture.image = UIImage(named: restaurants[indexPath.row].image!)
        //cell.thumbnail.layer.cornerRadius = 30
        //cell.thumbnail.clipsToBounds = true
        if restaurants[indexPath.row].isVisited! {
            cell.accessoryType = .checkmark
        }else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getContext()->NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        return context
    }
}

