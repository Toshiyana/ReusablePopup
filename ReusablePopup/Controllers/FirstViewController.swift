//
//  FirstViewController.swift
//  ReusablePopup
//
//  Created by Toshiyana on 2021/10/27.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
        
    var observer: NSObjectProtocol?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        observer = NotificationCenter.default.addObserver(
            forName: .saveDateTime, object: nil, queue: OperationQueue.main) { (notification) in
            let dateVc = notification.object as! DatePopupViewController//DatePopupViewControllerでpostしたpopupを取得
            self.dateLabel.text = dateVc.formattedDate
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    // using prepare(), send data from ViewController to Popup
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDatePopupViewControllerSegue" {
            let popup = segue.destination as! DatePopupViewController
            popup.showTimePicker = false//DatePickerを表示
        }
    }

}
