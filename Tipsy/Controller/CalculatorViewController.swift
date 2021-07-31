//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    var tip = 0.1
    
    @IBAction func tipChanged(_ sender: UIButton) {
        twentyPctButton.isSelected=false
        tenPctButton.isSelected=false
        zeroPctButton.isSelected=false
        sender.isSelected=true
        let tipTitle=sender.currentTitle!
        let tipValue=String(tipTitle.dropLast())
        tip=Double(tipValue)!/100.0
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text=String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(tip)
        print(splitNumberLabel.text!)
    }


}

