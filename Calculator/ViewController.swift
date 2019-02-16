//
//  ViewController.swift
//  Calculator
//
//  Created by Mubarak Awal on 15/02/2019.
//  Copyright © 2019 Mubarak Awal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    var currentOperator: Operator = Operator.nothing
    var calcState: CalculationState = CalculationState.newNumberStarted
    var firstValue: String = ""
    var currentOperatorTag: Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func numberClicked(_ sender: UIButton){
        updateLabel(number: String(sender.tag))
    }
    
    func updateLabel(number: String){
        if calcState==CalculationState.newNumberStarted{
            if let num = resultLabel.text{
                if num != ""{
                    firstValue = num
                }
            }
            calcState = CalculationState.enteringNumber
            resultLabel.text = number
        }else if calcState==CalculationState.enteringNumber{
            resultLabel.text = resultLabel.text! + number
        }
    }
    
    @IBAction func operatorClicked(_ sender: UIButton){
        calcState = CalculationState.newNumberStarted
        if let num = resultLabel.text{
            if num != ""{
                firstValue = num
                resultLabel.text = ""
            }
        }
        updateOperatorBackground(tag: sender.tag)
        switch sender.tag {
        case 10:
            currentOperator = Operator.add
        case 11:
            currentOperator = Operator.minus
        case 12:
            currentOperator = Operator.times
        case 13:
            currentOperator = Operator.divide
        default:
            return
        }
    }
    
    @IBAction func equalsClicked(_ sender: UIButton){
        if firstValue.isEmpty{
            return
        }
        if let num = resultLabel.text{
            if num != ""{
                calculateTotal()
            }
        }
    }
    
    func calculateTotal(){
        
        
        var result: String = ""
        
        if currentOperator==Operator.add{
            result = "\(Double(firstValue)! + Double(resultLabel.text!)!)"
        }else if currentOperator==Operator.minus{
            result = "\(Double(firstValue)! - Double(resultLabel.text!)!)"
        }else if currentOperator==Operator.times{
            result = "\(Double(firstValue)! * Double(resultLabel.text!)!)"
        }else if currentOperator==Operator.divide{
            result = "\(Double(firstValue)! / Double(resultLabel.text!)!)"
        }
        
        resultLabel.text = result
        calcState = CalculationState.newNumberStarted
    }
    
    func updateOperatorBackground(tag: Int){
        if currentOperatorTag != nil{
            if let button  = self.view.viewWithTag(currentOperatorTag!){
                button.backgroundColor = UIColor.clear
            }
            
        }
        let button = self.view.viewWithTag(tag)
        button?.backgroundColor = UIColor.red
        currentOperatorTag = tag
    }

}

