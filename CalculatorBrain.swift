//
//  CalculatorBrain.swift
//  SRM-GPA-Calculator
//
//  Created by Avaneesh Pathak on 12/04/20.
//  Copyright © 2020 Avaneesh Pathak. All rights reserved.
//

import Foundation
import UIKit

class CalculatorBrain {
    
    func calculateSGPA(creditGradeProdSum: Double, creditTotal: Double) -> String {
        let sgpa = Double(creditGradeProdSum)/Double(creditTotal)
        let sgpaFormatted = String(format: "%.2f", sgpa)
        return sgpaFormatted
    }
    
    func appendToGradeValueList(gradePointsArray: [String]) -> [Int] {
        
        var gradeValueListArray = [Int]()
        
        for i in gradePointsArray {
            if i == "O" {
                gradeValueListArray.append(10)
            } else if i == "A+" {
                gradeValueListArray.append(9)
            } else if i == "A" {
                gradeValueListArray.append(8)
            } else if i == "B+" {
                gradeValueListArray.append(7)
            } else if i == "B" {
                gradeValueListArray.append(6)
            } else if i == "C" {
                gradeValueListArray.append(5)
            } else if i == "P" {
                gradeValueListArray.append(4)
            } else if (i == "F" || i == "Ab" || i == "I") {
                gradeValueListArray.append(0)
            }
        }
        
        if gradeValueListArray.count < 9 {
            for _ in 1...(9-gradeValueListArray.count) {
                gradeValueListArray.append(0)
            }
        }
        
        return gradeValueListArray
    }
    
    func appendToCreditsArray(creditFieldArray: [UITextField]) -> [Int] {
        
        var creditsArray = [String]()
        var credits = [Int]()
        
        for i in creditFieldArray {
            creditsArray.append(i.text ?? "0")
        }
        
        //integer credits
        for i in creditsArray {
            if i == "" {
                credits.append(0)
            } else {
                credits.append(Int(i)!)
            }
        }
        return credits
    }
    
    func calcCreditSum(credits: [Int]) -> Double {
        var creditSum: Double = 0.0
        for i in credits {
            creditSum = creditSum + Double(i)
        }
        return creditSum
    }
    
    func appendToCreditGPProd(creditSum: Double, credits: [Int], gradeValueListArray: [Int]) -> [Int] {
        var creditGPProd = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        if creditSum > 0 {

            for i in 0...8 {
                creditGPProd[i] = credits[i] * gradeValueListArray[i]
            }
        }
        return creditGPProd
    }
    
    func calculateCreditProdSum(creditGPProduct: [Int]) -> Double {
        var creditProdSum : Double = 0.0
        for i in creditGPProduct {
            creditProdSum = creditProdSum + Double(i)
        }
        return creditProdSum
    }
}
