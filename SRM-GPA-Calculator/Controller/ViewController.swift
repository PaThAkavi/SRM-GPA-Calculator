//
//  ViewController.swift
//  SRM-GPA-Calculator
//
//  Created by Avaneesh Pathak on 05/04/20.
//  Copyright © 2020 Avaneesh Pathak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 25
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toCalculate", sender: self)
    }

}

