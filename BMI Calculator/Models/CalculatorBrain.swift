//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Antonio Hernández Santander on 04/01/26.
//  Copyright © 2026 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? "0.0")
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Oops!. Something went wrong."
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }

    mutating func calculateBMI(height: Float, weight: Float ) {
        let bmiValue = weight / pow(height, 2)
        
        switch bmiValue {
            case ..<18.5:
            bmi = BMI(value: bmiValue, advice: "Underweight. Eat more pies!", color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1) )
        case 18.5...24.9:
            bmi = BMI(value: bmiValue, advice: "Normal weight. Fit as a fiddle!", color: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1) )
        case 25...29.9:
            bmi = BMI(value: bmiValue, advice: "Overweight. Eat less cake!", color: .systemOrange)
        default:
            bmi = BMI(value: bmiValue, advice: "Obese", color: .systemRed)
        }
    }
    
}
