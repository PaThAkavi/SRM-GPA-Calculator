//
//  ResultViewController.swift
//  SRM-GPA-Calculator
//
//  Created by Avaneesh Pathak on 06/04/20.
//  Copyright © 2020 Avaneesh Pathak. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    
    var result: String?
    
    @IBOutlet weak var recalculateButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if result != "nan" {
            resultLabel.text = result
        } else {
            resultLabel.text = "Invalid Input"
        }
        recalculateButton.layer.cornerRadius = 25
    }

    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
