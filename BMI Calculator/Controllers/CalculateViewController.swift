//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!

    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func hightSliderChanged(_ sender: UISlider) {
        // print(round((sender.value)*100)/100)
        let heightValue = String(format: "%.2f", sender.value)
        heightValueLabel.text = ("\(heightValue) m")
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        // let weightValue = Int(sender.value)
        let weightValue = String(format: "%.0f", sender.value)
        weightValueLabel.text = ("\(weightValue) kg")
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let heightValue = heightSlider.value
        let weightValue = weightSlider.value
        calculatorBrain.calculateBMI(height: heightValue, weight: weightValue)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    };
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

