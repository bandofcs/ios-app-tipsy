//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    var calculatorBrain=CalculatorBrain()
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        twentyPctButton.isSelected=false
        tenPctButton.isSelected=false
        zeroPctButton.isSelected=false
        sender.isSelected=true
        calculatorBrain.getTip(tipButton: sender.currentTitle!)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text=String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        calculatorBrain.getBillSplit(totalBill: billTextField.text!,splitNumber: splitNumberLabel.text!)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //In the event that there are many viewcontrollers to transit to, always check
        if segue.identifier=="goToResult"{
            //Create a reference to the resultviewcontroller, as! is for downcast as resultviewcontroller is subclass to UIViewcontroller super class
            let destinationVC=segue.destination as! ResultsViewController
            destinationVC.totalValue=String(calculatorBrain.billSplit)
            destinationVC.settingsValue =
                String("Split between \(splitNumberLabel.text!) people, with \(Int(calculatorBrain.tip*100))% tip.")
        }
    }


}

