//
//  ViewController.swift
//  HighAndLow
//
//  Created by 時津幸司 on 2016/04/29.
//  Copyright © 2016年 時津幸司. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var Label: UILabel!
    @IBOutlet var ButtonHigh: UIButton!
    @IBOutlet var ButtonLow: UIButton!
    @IBOutlet var Result: UILabel!
    @IBOutlet var Score: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Label.text = String(rand() % 13 + 1)
        Result.text?.removeAll()
        Score.text = String(0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didButtonTouchDown(sender: UIButton) {
        let currentNumber = Int32(Label.text!)
        let nextNumber = rand() % 13 + 1
        var correct = false
        switch(sender){
        case ButtonHigh:
            if currentNumber < nextNumber {
                correct = true
            }
        case ButtonLow:
            if currentNumber > nextNumber {
                correct = true
            }
        default:
            print("Unknown button is touched down.")
        }
        
        if correct {
            Result.text = "Correct!"
            Result.textColor = UIColor.blackColor()
            Score.text = String(Int(Score.text!)!+1)
        }
        else{
            Result.text = "Game over"
            Result.textColor = UIColor.redColor()
            Score.text = String(0)
        }
        
        Label.text = String(nextNumber)
    }
}

