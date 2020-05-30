//
//  CalculatorViewController.swift
//  CalculatorPractice
//
//  Created by John McCants on 5/28/20.
//  Copyright © 2020 John McCants. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var outputLabel: UILabel!
    
    var brain : CalculatorBrain?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        brain = CalculatorBrain()
        
    }
    


    @IBAction func digitTapped(_ sender: UIButton) {
    
        if let unwrappedDigit = sender.titleLabel?.text {
            outputLabel.text = brain?.digitTapped(digit: unwrappedDigit)                      
        }

      
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        if let unwrappedOne = brain?.stringOne, let unwrappedTwo = brain?.stringTwo {
            if unwrappedOne != "" && unwrappedTwo != "" {
                outputLabel.text = brain?.calculateEquation()
            }
        }
        
        if let unwrappedOperator = sender.titleLabel?.text {
            brain?.operatorTapped(operatorString: unwrappedOperator)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
    
        outputLabel.text = brain?.calculateEquation()
        
    }
    
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        
        brain?.clearEverything()
        outputLabel.text = "0"
    }
    
    
    
    
    
    
    
    
    
}
