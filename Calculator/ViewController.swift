//
//  ViewController.swift
//  Calculator
//
//  Created by Taylor Mott on 10/29/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var stack: Stack = Stack()
    
    let label = UILabel()
    
    let button0 = UIButton()
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    let button5 = UIButton()
    let button6 = UIButton()
    let button7 = UIButton()
    let button8 = UIButton()
    let button9 = UIButton()
    let buttonDivide = UIButton()
    let buttonMultiply = UIButton()
    let buttonMinus = UIButton()
    let buttonAdd = UIButton()
    let buttonEnter = UIButton()
    
    
    var isTyping: Bool = true

    var displayValue: Float {
        get {
            let numberString: String = label.text!
            let nsNumberString = NSString(string: numberString)
            return nsNumberString.floatValue
        }
        set {
            let newValueString = "\(newValue)"
            label.text = newValueString
            isTyping = false
        }
    }
    
    
    @IBAction func buttonPressed(sender: UIButton) {
        addNumToLabel(sender)
    }
    
    func addNumToLabel(button: UIButton) {
        let buttonNum = button.titleLabel?.text
        if !isTyping || label.text == "0"{
            label.text = buttonNum
        } else {
            label.text = label.text! + buttonNum!
        }
    }

    func pushLogDisplayValue() {
        
    }
    
    
    // Label
    func addLabel() {
        
        label.backgroundColor = UIColor.blackColor()
        label.textColor = .whiteColor()
        view.addSubview(label)
        addLabelConstraints()
        
    }
    
    func addLabelConstraints() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let labelLeadingConstraint = NSLayoutConstraint(item: label, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1, constant: 0)
        
        let labelTrailingConstraint = NSLayoutConstraint(item: label, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1, constant: 0)
        
        let labelTopConstraint = NSLayoutConstraint(item: label, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1, constant: 0)

        let labelHeightConstraint = NSLayoutConstraint(item: label, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 1/3, constant: 0)

        view.addConstraints([labelLeadingConstraint, labelHeightConstraint, labelTrailingConstraint, labelTopConstraint])
    }

    // Buttons
    func addButton(button: UIButton) {
        button.layer.borderColor = UIColor.blackColor().CGColor
        button.layer.borderWidth = 1
        switch (button) {
            
        case button7, button8, button9:
            button.addTarget(self, action: "buttonPressed:", forControlEvents: .TouchUpInside)
            button.backgroundColor = UIColor.grayColor()
            view.addSubview(button)
            addTopRowButtonConstraints(button)

        case (buttonDivide):
            button.backgroundColor = .orangeColor()
            view.addSubview(button)
            addTopRowButtonConstraints(button)
        
        case button4, button5, button6:
            button.addTarget(self, action: "buttonPressed:", forControlEvents: .TouchUpInside)
            button.backgroundColor = UIColor.grayColor()
            view.addSubview(button)
            addSecondRowButtonConstraints(button)

        case (buttonMultiply):
            button.backgroundColor = UIColor.orangeColor()
            view.addSubview(button)
            addSecondRowButtonConstraints(button)

        case button1, button2, button3:
            button.addTarget(self, action: "buttonPressed:", forControlEvents: .TouchUpInside)
            button.backgroundColor = UIColor.grayColor()
            view.addSubview(button)
            addThirdRowButtonConstraints(button)
        
        case (buttonMinus):
            button.backgroundColor = UIColor.orangeColor()
            view.addSubview(button)
            addThirdRowButtonConstraints(button)
            
        case (button0):
            button.addTarget(self, action: "buttonPressed:", forControlEvents: .TouchUpInside)
            button.backgroundColor = UIColor.orangeColor()
            view.addSubview(button)
            addBottomRowButtonConstraints(button)
            
        case (buttonEnter):
            button.backgroundColor = UIColor.greenColor()
            button.setTitleColor(.blackColor(), forState: .Normal)
            view.addSubview(button)
            addBottomRowButtonConstraints(button)

        case (buttonAdd):
            button.backgroundColor = UIColor.orangeColor()
            view.addSubview(button)
            addBottomRowButtonConstraints(button)

        default:
            print("other button")
        }
        
        var widthConstraint = NSLayoutConstraint()
        if button != button0 {
            widthConstraint = NSLayoutConstraint(item: button, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1/4, constant: 0)
        } else {
            widthConstraint = NSLayoutConstraint(item: button, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: (1/4)*2, constant: 0)
        }
        
        let heightConstraint = NSLayoutConstraint(item: button, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 1/(3*2), constant: 0)
        
        view.addConstraints([heightConstraint, widthConstraint])
    
    }
    
    func addTopRowButtonConstraints(button: UIButton){
        button.translatesAutoresizingMaskIntoConstraints = false
        
        //add top constraint because they all have the same top constraint
        let buttonTopConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: label, attribute: .Bottom, multiplier: 1, constant: 0)
       
        var buttonLeftConstraint = NSLayoutConstraint()

        switch button {
        case button7:
            // add left constraint
            buttonLeftConstraint = NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1, constant: 0)

        case button8:
            // add left constraint
            buttonLeftConstraint = NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: button7, attribute: .Trailing, multiplier: 1, constant: 0)

        case button9:
            // add left constraint
            buttonLeftConstraint = NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: button8, attribute: .Trailing, multiplier: 1, constant: 0)

        case buttonDivide:
            // add left constraint
            buttonLeftConstraint = NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: button9, attribute: .Trailing, multiplier: 1, constant: 0)
            // add right constraint
            let buttonRightConstraint = NSLayoutConstraint(item: button, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1, constant: 0)
            view.addConstraint(buttonRightConstraint)
            
        default:
         print("Button to constrain undefined.")
        }
        
        view.addConstraints([buttonTopConstraint, buttonLeftConstraint])
    }

    func addSecondRowButtonConstraints(button: UIButton){
        button.translatesAutoresizingMaskIntoConstraints = false
        
        var buttonTopConstraint = NSLayoutConstraint()
        var buttonLeftConstraint = NSLayoutConstraint()
        
        switch button {
        case button4:
            // add top constraint
            buttonTopConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: button7, attribute: .Bottom, multiplier: 1, constant: 0)
            // add left constraint
            buttonLeftConstraint = NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1, constant: 0)
            
        case button5:
            // add top constraint
            buttonTopConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: button8, attribute: .Bottom, multiplier: 1, constant: 0)
            // add left constraint
            buttonLeftConstraint = NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: button4, attribute: .Trailing, multiplier: 1, constant: 0)
            
        case button6:
            // add top constraint
            buttonTopConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: button9, attribute: .Bottom, multiplier: 1, constant: 0)
            // add left constraint
            buttonLeftConstraint = NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: button5, attribute: .Trailing, multiplier: 1, constant: 0)
            
        case buttonMultiply:
            // add top constraint
            buttonTopConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: buttonDivide, attribute: .Bottom, multiplier: 1, constant: 0)
            // add left constraint
            buttonLeftConstraint = NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: button6, attribute: .Trailing, multiplier: 1, constant: 0)
            // add right constraint
            let buttonRightConstraint = NSLayoutConstraint(item: button, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1, constant: 0)
            view.addConstraint(buttonRightConstraint)
            
        default:
            print("Button to constrain undefined.")
        }
        
        view.addConstraints([buttonTopConstraint, buttonLeftConstraint])
    }

    
    func addThirdRowButtonConstraints(button: UIButton){
        button.translatesAutoresizingMaskIntoConstraints = false
        
        var buttonTopConstraint = NSLayoutConstraint()
        var buttonLeftConstraint = NSLayoutConstraint()
        
        switch button {
        case button1:
            // add top constraint
            buttonTopConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: button4, attribute: .Bottom, multiplier: 1, constant: 0)
            // add left constraint
            buttonLeftConstraint = NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1, constant: 0)
            
        case button2:
            // add top constraint
            buttonTopConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: button5, attribute: .Bottom, multiplier: 1, constant: 0)
            // add left constraint
            buttonLeftConstraint = NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: button1, attribute: .Trailing, multiplier: 1, constant: 0)
            
        case button3:
            // add top constraint
            buttonTopConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: button6, attribute: .Bottom, multiplier: 1, constant: 0)
            // add left constraint
            buttonLeftConstraint = NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: button2, attribute: .Trailing, multiplier: 1, constant: 0)
            
        case buttonMinus:
            // add top constraint
            buttonTopConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: buttonMultiply, attribute: .Bottom, multiplier: 1, constant: 0)
            // add left constraint
            buttonLeftConstraint = NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: button3, attribute: .Trailing, multiplier: 1, constant: 0)
            // add right constraint
            let buttonRightConstraint = NSLayoutConstraint(item: button, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1, constant: 0)
            view.addConstraint(buttonRightConstraint)
            
        default:
            print("Button to constrain undefined.")
        }
        
        view.addConstraints([buttonTopConstraint, buttonLeftConstraint])
    }

    
    func addBottomRowButtonConstraints(button: UIButton){
        button.translatesAutoresizingMaskIntoConstraints = false
        
        var buttonTopConstraint = NSLayoutConstraint()
        var buttonLeftConstraint = NSLayoutConstraint()
        var buttonBottomConstraint = NSLayoutConstraint(item: button, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1, constant: 0)
        
        switch button {
        case button0:
            // add top constraint
            buttonTopConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: button2, attribute: .Bottom, multiplier: 1, constant: 0)
            // add left constraint
            buttonLeftConstraint = NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1, constant: 0)
            
        case buttonEnter:
            // add top constraint
            buttonTopConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: button3, attribute: .Bottom, multiplier: 1, constant: 0)
            // add left constraint
            buttonLeftConstraint = NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: button0, attribute: .Trailing, multiplier: 1, constant: 0)
            
        case buttonAdd:
            // add top constraint
            buttonTopConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: buttonMinus, attribute: .Bottom, multiplier: 1, constant: 0)
            // add left constraint
            buttonLeftConstraint = NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: buttonEnter, attribute: .Trailing, multiplier: 1, constant: 0)
            // add right constraint
            let buttonRightConstraint = NSLayoutConstraint(item: button, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1, constant: 0)
            view.addConstraint(buttonRightConstraint)
            
        default:
            print("Button to constrain undefined.")
        }
        
        view.addConstraints([buttonTopConstraint, buttonLeftConstraint, buttonBottomConstraint])
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.whiteColor()

        label.text = "0"
        label.textAlignment = NSTextAlignment.Right
        addLabel()
        
        button7.setTitle("7", forState: .Normal)
        addButton(button7)
        
        
        button8.setTitle("8", forState: .Normal)
        addButton(button8)
        
        
        button9.setTitle("9", forState: .Normal)
        addButton(button9)
        
        buttonDivide.setTitle("÷", forState: .Normal)
        addButton(buttonDivide)
        
        button4.setTitle("4", forState: .Normal)
        addButton(button4)
        
        button5.setTitle("5", forState: .Normal)
        addButton(button5)
        
        button6.setTitle("6", forState: .Normal)
        addButton(button6)
        
        buttonMultiply.setTitle("*", forState: .Normal)
        addButton(buttonMultiply)
        
        button1.setTitle("1", forState: .Normal)
        addButton(button1)
        
        button2.setTitle("2", forState: .Normal)
        addButton(button2)
        
        button3.setTitle("3", forState: .Normal)
        addButton(button3)
        
        buttonMinus.setTitle("-", forState: .Normal)
        addButton(buttonMinus)
        
        button0.setTitle("0", forState: .Normal)
        addButton(button0)
        
        buttonEnter.setTitle("Enter", forState: .Normal)
        addButton(buttonEnter)
        
        buttonAdd.setTitle("+", forState: .Normal)
        addButton(buttonAdd)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}