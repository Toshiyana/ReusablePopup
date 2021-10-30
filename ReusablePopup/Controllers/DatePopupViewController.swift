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
    @IBOutlet weak var popupView: UIView!
    
    var showTimePicker: Bool = false
    // functionの定義（functionのtypeはinput, output parameterのtype）
    // 今回、初期値は持ちたくないのでoptional
    var onSave: ((_ data: String) -> ())?
    
    var delegate: PopupDelegate?
    
    // computed property(only getter)
    // datePickerから取得するdateのformatを整える変数
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: datePicker.date)
    }
    
    var formattedTime: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: datePicker.date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if showTimePicker {
            titleLabel.text = "Select Time"
            datePicker.datePickerMode = .time
            saveButton.setTitle("Save Time", for: .normal)
        }
        
        // pattern1: make UIViewCorner rounded (not include shadow)
//        popupView.layer.cornerRadius = 15
//        popupView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
//        popupView.layer.masksToBounds = true
        
        // pattern2: add shadow to UIView (not include round)
        // popupView.layer.masksToBoundsはデフォルトでfalse
        popupView.layer.shadowOffset = CGSize(width: 10, height: 10)
        popupView.layer.shadowRadius = 15
        popupView.layer.shadowOpacity = 0.5
        
        // pattern3: round + shadow は面倒なので省略
        
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        // PopupからViewControllerにデータを渡す
        // FirstViewController：NotificationCenterを利用
        NotificationCenter.default.post(name: .saveDateTime, object: self)//popupオブジェクトをpostする
        
        // SecondViewController：Callbacksを利用 (onSave?(formattedTime))
        // SelectTimeViewController: Delegateを利用
        if showTimePicker {
            onSave?(formattedTime)
            delegate?.popupValueSelected(value: formattedTime)
        } else {
            onSave?(formattedDate)
            delegate?.popupValueSelected(value: formattedDate)
        }
        
        dismiss(animated: false)
    }
    
}
