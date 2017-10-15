//
//  ViewController.swift
//  TipCalcbasic
//
//  Created by Charnpreet Singh on 10/8/17.
//  Copyright © 2017 Charnpreet Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var actualTipAmount: UILabel!
    @IBOutlet var totalBillAmount: UILabel!
    @IBOutlet var initalBillAmount: UITextField!
    @IBOutlet var tipIndex: UISegmentedControl!
    
    let tipVals = [0.10,0.15, 0.20]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        actualTipAmount.text = "Bill Amount not entered"
        totalBillAmount.text = "Bill Amount not entered"
        let keyboardDismiss = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(keyboardDismiss)
    }
    
    @objc func dismissKeyboard() {
        initalBillAmount.endEditing(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func helloWorld(_ sender: Any) {
        print("Hello world! The app works!")
    }
    
    @IBAction func billAmountEntered(_ sender: Any) {
        print("bill amount entered")
        let bill = Double(initalBillAmount.text!) ?? 0
        let tip = bill * tipVals[tipIndex.selectedSegmentIndex]
        actualTipAmount.text = String(format: "$%.2f", tip)
        totalBillAmount.text = String(format: "$%.2f", bill + tip)
    }
    
    @IBAction func updateTipValueAgain(_ sender: Any) {
        billAmountEntered(UISegmentedControl())
    }
}

