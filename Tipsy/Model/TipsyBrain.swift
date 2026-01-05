//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Antonio Hernández Santander on 04/01/26.
//  Copyright © 2026 The App Brewery. All rights reserved.
//

import Foundation

struct TipsyBrain {
    
    var tipsy: Tipsy?
    
    func getBill () -> Float {
        return tipsy?.bill ?? 0
    }
    
    func getTip () -> Float {
        return Float(tipsy?.tipPercentage ?? 0)/100
    }

    func getSplit () -> Int {
        return tipsy?.numberOfPeople ?? 1
    }
    
    func calculateTotal () -> Float {
        return (getBill() * getTip()) / Float(getSplit())
    }
}
