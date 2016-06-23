//
//  ViewController.swift
//  Magic Life Counter
//
//  Created by Erica Clark on 6/22/16.
//  Copyright © 2016 Clark. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    
    @IBOutlet weak var player2: UILabel!
    @IBOutlet weak var player1: UILabel!
    
    @IBOutlet weak var stepper5For1: UIStepper!
    
    @IBOutlet weak var stepper5For2: UIStepper!
    @IBOutlet weak var stepper1For2: UIStepper!
    @IBOutlet weak var stepper1For1: UIStepper!
    var life1 = 20.0
    var life2 = 20.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        player1.text = String(Int(life1))
        player2.text = String(Int(life2))
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    
    //All the steppers will go through this method to change the life totals

    @IBAction func stepperValueChanged(sender: UIStepper) {
        if sender === stepper1For1{
            life1 += sender.value
            sender.value = 0
            player1.text = String(Int(life1))
        }
        else if sender === stepper1For2{
            life2 += sender.value
            sender.value = 0
            player2.text = String(Int(life2))
            
        }
        else if sender === stepper5For1{
            life1 += sender.value
            sender.value = 0
            player1.text = String(Int(life1))
        }
        else if sender === stepper5For2{
            life2 += sender.value
            sender.value = 0
            player2.text = String(Int(life2))
        }
        
    }

}

