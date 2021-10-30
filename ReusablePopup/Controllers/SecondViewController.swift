//
//  SecondViewController.swift
//  ReusablePopup
//
//  Created by Toshiyana on 2021/10/27.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    
    // using prepare(), send data from ViewController to Popup
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDatePopupViewControllerSegue" {
            let popup = segue.destination as! DatePopupViewController
            popup.showTimePicker = false//DatePickerを表示
            
            // 関数を代入する方法
            // Pattern1: Assign to function
            // popup.onSave = onSave
            
            // Pattern2: Use a closure
            popup.onSave = { (data: String) -> () in
                self.dateLabel.text = data
            }
        }
    }
    
    // Pattern1: Assign to function
//    func onSave(_ data: String) {
//        dateLabel.text = data
//    }
    
    
    
}
