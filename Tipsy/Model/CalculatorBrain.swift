//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by CSD on 31/7/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain{
    var tip = 0.1
    var billSplit=0.0
    mutating func getTip(tipButton:String){
        tip=Double(String(tipButton.dropLast()))!/100.0
    }
    mutating func getBillSplit(totalBill:String,splitNumber:String){
        billSplit=round(100 * (1.0+tip)*(Double(round(100 * Double(totalBill)!)/100))/(Double(splitNumber)!))/100
    }
}
