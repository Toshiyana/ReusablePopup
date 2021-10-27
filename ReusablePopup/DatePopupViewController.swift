//
//  DatePopupViewController.swift
//  ReusablePopup
//
//  Created by Toshiyana on 2021/10/27.
//

import UIKit

class DatePopupViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        dismiss(animated: false)
    }
    
}
