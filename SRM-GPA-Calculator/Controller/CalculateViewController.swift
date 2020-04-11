//
//  CalculateViewController.swift
//  SRM-GPA-Calculator
//
//  Created by Avaneesh Pathak on 06/04/20.
//  Copyright © 2020 Avaneesh Pathak. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    var gradePoints = [String]()
    var gradeValueList = [Int]()
    var credits = [Int]()
    var creditsArray = [String]()
    var activeField: UITextField?
    let gradeCounts = ["O", "A+", "A", "B+", "B", "C", "P", "F", "Ab", "I"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gradeCounts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        activeField?.text = gradeCounts[row]
        gradePoints.append(activeField?.text ?? "I")
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gradeCounts[row]
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeField = textField
        return true
    }
    

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradesFieldArray : [UITextField] = [grade1, grade2, grade3, grade4, grade5, grade6, grade7, grade8, grade9]
        picker.delegate = self
        for gradeField in gradesFieldArray {
            gradeField.delegate = self
            gradeField.inputView = picker
        }
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func calculation(){
        var creditSum = 0
        //print(gradePoints)
        for i in gradePoints {
            if i == "O" {
                gradeValueList.append(10)
            } else if i == "A+" {
                gradeValueList.append(9)
            } else if i == "A" {
                gradeValueList.append(8)
            } else if i == "B+" {
                gradeValueList.append(7)
            } else if i == "B" {
                gradeValueList.append(6)
            } else if i == "C" {
                gradeValueList.append(5)
            } else if i == "P" {
                gradeValueList.append(4)
            } else if i == "F" || i == "Ab" || i == "I" {
                gradeValueList.append(0)
            }
        }
        
        for _ in 1...9-gradeValueList.count {
            gradeValueList.append(0)
        }
        
        //print(gradeValueList)
        
        creditsArray.append(credit1.text ?? "0")
        creditsArray.append(credit2.text ?? "0")
        creditsArray.append(credit3.text ?? "0")
        creditsArray.append(credit4.text ?? "0")
        creditsArray.append(credit5.text ?? "0")
        creditsArray.append(credit6.text ?? "0")
        creditsArray.append(credit7.text ?? "0")
        creditsArray.append(credit8.text ?? "0")
        creditsArray.append(credit9.text ?? "0")
        
        
        for i in creditsArray {
            if i == "" {
                credits.append(0)
            } else {
                credits.append(Int(i) ?? 0)
            }
        }
        //print(credits)
        for i in credits {
            creditSum = creditSum + i
        }
        var creditGPProd = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        if creditSum > 0 {
            
            for i in 0...8 {
                creditGPProd[i] = credits[i] * gradeValueList[i]
            }
        }
        print(creditGPProd)
        
        var creditProdSum = 0
        for i in creditGPProd {
            creditProdSum = creditProdSum + i
        }
        
        let sgpa = creditProdSum/creditSum
        
        print(Double(sgpa))
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        creditsArray = []
        calculation()
        performSegue(withIdentifier: "toRecalculate", sender: self)
        
    }
}
