//
//  CalculateViewController.swift
//  SRM-GPA-Calculator
//
//  Created by Avaneesh Pathak on 06/04/20.
//  Copyright © 2020 Avaneesh Pathak. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var sgpaStringFormatted: String?
    let calculatorBrain = CalculatorBrain()
    
    var gradePoints = [String]()
    var gradeValueList = [Int]()
    var credits = [Int]()
    var activeField: UITextField?
    let gradeCounts = ["O", "A+", "A", "B+", "B", "C", "P", "F", "Ab", "I"]
    
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var credit1: UITextField!
    @IBOutlet weak var credit2: UITextField!
    @IBOutlet weak var credit3: UITextField!
    @IBOutlet weak var credit4: UITextField!
    @IBOutlet weak var credit5: UITextField!
    @IBOutlet weak var credit6: UITextField!
    @IBOutlet weak var credit7: UITextField!
    @IBOutlet weak var credit8: UITextField!
    @IBOutlet weak var credit9: UITextField!
    @IBOutlet weak var grade1: UITextField!
    @IBOutlet weak var grade2: UITextField!
    @IBOutlet weak var grade3: UITextField!
    @IBOutlet weak var grade4: UITextField!
    @IBOutlet weak var grade5: UITextField!
    @IBOutlet weak var grade6: UITextField!
    @IBOutlet weak var grade7: UITextField!
    @IBOutlet weak var grade8: UITextField!
    @IBOutlet weak var grade9: UITextField!
    
    let picker = UIPickerView()
    
    var creditsFieldArray = [UITextField]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateButton.layer.cornerRadius = 25
        //calculateButton.isEnabled = false
        picker.dataSource = self
        
        let gradesFieldArray : [UITextField] = [grade1, grade2, grade3, grade4, grade5, grade6, grade7, grade8, grade9]
        creditsFieldArray = [credit1, credit2, credit3, credit4, credit5, credit6, credit7, credit8, credit9]
        picker.delegate = self
        for gradeField in gradesFieldArray {
            gradeField.delegate = self
            gradeField.inputView = picker
        }
        
        for credit in creditsFieldArray {
            credit.keyboardType = .numberPad
        }
        
        //for the keypad to dissmiss when tapped anywhere else on the screen
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    func calculation(){
        
        var creditSum : Double = 0.0
        gradeValueList = calculatorBrain.appendToGradeValueList(gradePointsArray: gradePoints)
        
        credits = calculatorBrain.appendToCreditsArray(creditFieldArray: creditsFieldArray)
        
        creditSum = calculatorBrain.calcCreditSum(credits: credits)
        
        var creditGPProd = [Int]()
        creditGPProd = calculatorBrain.appendToCreditGPProd(creditSum: creditSum, credits: credits, gradeValueListArray: gradeValueList)
        
        var creditProdSum: Double = 0.0
        creditProdSum = calculatorBrain.calculateCreditProdSum(creditGPProduct: creditGPProd)
        
        sgpaStringFormatted = calculatorBrain.calculateSGPA(creditGradeProdSum: creditProdSum, creditTotal: creditSum)

    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        //creditsArray = []
        calculation()
        performSegue(withIdentifier: "toRecalculate", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRecalculate" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = sgpaStringFormatted
        }
    }
    
}

//MARK: - Picker View methods
extension CalculateViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gradeCounts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        activeField?.text = gradeCounts[row]
        //print(activeField?.text as Any)
        gradePoints.append(activeField?.text ?? "I")
        //self.view.endEditing(true)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gradeCounts[row]
    }
}

//MARK: - TextField methods
extension CalculateViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeField = textField
        return true
    }
}
