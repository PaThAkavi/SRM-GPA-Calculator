//
//  CalculateViewController.swift
//  SRM-GPA-Calculator
//
//  Created by Avaneesh Pathak on 06/04/20.
//  Copyright © 2020 Avaneesh Pathak. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toRecalculate", sender: self)
        
    }
}
