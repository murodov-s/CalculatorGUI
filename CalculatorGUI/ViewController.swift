//
//  ViewController.swift
//  CalculatorGUI
//
//  Created by user181171 on 10/9/20.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var preformingMath = false;
    var operation = 0;
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if preformingMath == true
        {
            label.text = String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
            preformingMath = false
        }
        else
        {
            label.text = label.text! + String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if label.text != "" && sender.tag != 11 && sender.tag != 18
        {
            previousNumber = Double(label.text!)!
            
            if sender.tag == 12 // sign change
            {
            }
            else if sender.tag == 13 // remainder
            {
                label.text = "%";
            }
            else if sender.tag == 14 // divide
            {
                label.text = "/";
            }
            else if sender.tag == 15 // multiply
            {
                label.text = "x";
            }
            else if sender.tag == 16 // subtract
            {
                label.text = "-";
            }
            else if sender.tag == 17 // add
            {
                label.text = "+";
            }
            else if sender.tag == 19 // dot
            {
            }
            
            operation = sender.tag
            preformingMath = true;
        }
        else if sender.tag == 18
        {
            if operation == 14
            {
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 15
            {
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 16
            {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 17
            {
                label.text = String(previousNumber + numberOnScreen)
            }
        }
        else if sender.tag == 11
        {
            label.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

