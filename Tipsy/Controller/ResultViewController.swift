//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Antonio Hernández Santander on 04/01/26.
//  Copyright © 2026 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    var total: Float?
    var tipPercentage: Int?
    var numberOfPeople: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format: "$%.2f", total ?? "0.00")
        detailsLabel.text = "Split between \(numberOfPeople!) people, with \(tipPercentage!)% tip."
    }
    
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        dismiss(animated: true , completion: nil)
    }
    
}
