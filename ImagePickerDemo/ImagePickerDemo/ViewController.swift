//
//  ViewController.swift
//  ImagePickerDemo
//
//  Created by Ray on 2016/12/22.
//  Copyright © 2016年 kuas. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    @IBOutlet weak var image: UIImageView!
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let alertController = UIAlertController(
                title: "提示",
                message: "一個簡單提示，請按確認繼續",
                preferredStyle: .alert)
            
            // 建立[確認]按鈕
            let okAction = UIAlertAction(
                title: "確認",
                style: .default,
                handler: {
                    (action: UIAlertAction!) -> Void in
                    print("按下確認後，閉包裡的動作")
            })
            alertController.addAction(okAction)
            
            // 顯示提示框
            present(alertController,animated: true,completion: nil)
            break;
        case 1:
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                present(imagePicker,animated: true,completion: nil)
            }
            break;
        case 2:
            break;
        default:
            break;
        }
    }

    @IBAction func addImage(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .camera
            present(imagePicker,animated: true,completion: nil)
        }
    }

}

