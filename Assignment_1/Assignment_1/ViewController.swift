//
//  ViewController.swift
//  Assignment_1
//
//  Created by Marmik Nalinkumar Patel on 2025-02-07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var BMILabel: UILabel!
    @IBOutlet weak var classLable: UILabel!
    
    @IBOutlet weak var unitSegmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BMILabel.text = "BMI Result"
        classLable.text = "Classification"
    }

    
    @IBAction func calculateBMI(_ sender: UIButton) {
        guard let heightString = heightTextField.text,
              let height = Double(heightString),height < 250 || height > 0 else{
            BMILabel.text = "Please Enter Valid Value"
            classLable.text = "Please Enter Valid Value"
            return
        }
        
        guard let weightString = weightTextField.text,
              let weight = Double(weightString),weight < 650 || weight > 0 else{
            BMILabel.text = "Please Enter Valid Value"
            classLable.text = "Please Enter Valid Value"
            return
        }
        var result: Double = 0
        switch unitSegmentControl.selectedSegmentIndex {
        case 0:
            let heightInMeters = height / 100
            result = weight / (heightInMeters * heightInMeters)
        case 1:
            let weightInKg = weight * 0.453592
            let heightInMeters = height * 0.0254
            result = weightInKg / (heightInMeters * heightInMeters)
        default:
            BMILabel.text = "Please Enter Valid Value"
            return
        }
        BMILabel.text = String((result * 10).rounded() / 10)
        
        switch result {
        case let result where result < 18.5:
            classLable.text = "Underweight"
        case let result where result < 24.9:
            classLable.text = "Normal weight"
        case let result where result < 29.9:
            classLable.text = "Overweight"
        case let result where result > 30:
            classLable.text = "Obesity"
        default:
            classLable.text = "Please Enter Valid Value"
        }
        clearTextFields()
    }
    func clearTextFields() {
            heightTextField.text = ""
            weightTextField.text = ""
    }
}

