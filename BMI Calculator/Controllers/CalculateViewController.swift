//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Steven Sim on 16/10/19.
//  Copyright © 2019 Steven Sim. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
//    var calculatedBmi = "0.0"
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        
        //print(sender.value)
        
        let height = String(format: "%.2f", sender.value)
        
//        print(String(format: "%.2f", sender.value))
        heightLabel.text = "\(height)m"
        
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        //print(sender.value)
        
        let weight = String(format: "%.0f", sender.value)
        
//        print(Int(sender.value))
        weightLabel.text = "\(weight)Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
//        print(heightSlider.value)
//        print(weightSlider.value)
        
        let height = heightSlider.value
        let weight = weightSlider.value
        
//        let bmi = weight / pow(height, 2)
//
//        calculatedBmi = String(format: "%.1f", bmi)
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

