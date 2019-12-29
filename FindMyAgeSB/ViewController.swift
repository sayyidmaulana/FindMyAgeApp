//
//  ViewController.swift
//  FindMyAgeSB
//
//  Created by sayyid maulana khakul yakin on 28/12/19.
//  Copyright © 2019 sayyid maulana khakul yakin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        view.backgroundColor = UIColor(red: 51/255, green: 99/255, blue: 149/255, alpha: 1)
        view.backgroundColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
    }
    @IBAction func calculateMyAge(_ sender: Any) {
        //get selected date from date picker
        let birthDay = self.datePicker.date
        // yyyy-mm-dd hh:mm:ss +0000
        
        // get today date
        let today = Date()
        
        // check our birthday is earlier than roday
        if birthDay >= today {
            let alertController = UIAlertController(title: "Error", message: "Please enter a valid date", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Yes", style: .default, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
            return
        }
        let calendar = Calendar.current
        
        let components = calendar.dateComponents([.year, .month, .day], from: birthDay, to: today)
        
        guard let ageYears = components.year else { return }
        guard let ageMonth = components.month else { return }
        guard let ageDay = components.day else { return }
        
        self.ageLabel.text = "\(ageYears) years, \(ageMonth) month, \(ageDay) day"
    }
    

}

