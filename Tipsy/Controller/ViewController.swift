//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipField: UITextField!
    @IBOutlet weak var zeroTipButton: UIButton!
    @IBOutlet weak var tenTipButton: UIButton!
    @IBOutlet weak var twentyTipButton: UIButton!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var tipsyBrain = TipsyBrain()
    var tipsy = Tipsy()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepper.value = 2
    }
    
    @IBAction func tipPressed(_ sender: UIButton) {
        switch sender.tag {
            case 0:
                zeroTipButton.isSelected = true
                tenTipButton.isSelected = false
                twentyTipButton.isSelected = false
                tipsy.tipPercentage = 0
            case 10:
                zeroTipButton.isSelected = false
                tenTipButton.isSelected = true
                twentyTipButton.isSelected = false
                tipsy.tipPercentage = 10
            default:
                zeroTipButton.isSelected = false
                tenTipButton.isSelected = false
                twentyTipButton.isSelected = true
                tipsy.tipPercentage = 20
        }
        
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        let splitValue = String(format: "%.0f", sender.value)
        splitLabel.text = splitValue
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        tipsy.bill = Float(tipField.text ?? "0")
        tipsy.numberOfPeople = Int(stepper.value)
        tipsyBrain.tipsy = tipsy
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let total = tipsyBrain.calculateTotal()
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.total = total
            destinationVC.tipPercentage = tipsy.tipPercentage
            destinationVC.numberOfPeople = tipsy.numberOfPeople
        }
    }
}

