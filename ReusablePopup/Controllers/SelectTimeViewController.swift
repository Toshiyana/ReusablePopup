//
//  SelectTimeViewController.swift
//  ReusablePopup
//
//  Created by Toshiyana on 2021/10/27.
//

import UIKit

class SelectTimeViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectTimeButtonPressed() {
        let sb = UIStoryboard(name: "DatePopupViewController", bundle: nil)
        //storyboardが存在することは確実なので、if letでなく!を用いる。
        let popup = sb.instantiateInitialViewController()! as! DatePopupViewController
        popup.showTimePicker = true
        
        popup.delegate = self
        
        self.present(popup, animated: true)
    }

}

extension SelectTimeViewController: PopupDelegate {
    func popupValueSelected(value: String) {
        timeLabel.text = value
    }
    
    
}
