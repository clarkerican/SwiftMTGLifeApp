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
    let socket = SocketIOClient(socketURL: NSURL(string:"http://192.168.2.7:8000")!)
    
    let error : NSError? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        player1.text = String(Int(life1))
        player2.text = String(Int(life2))
        self.addHandlers()
        self.socket.connect()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    
    //All the steppers will go through this method to change the life totals

    @IBAction func stepperValueChanged(sender: UIStepper) {
        
        var value1 = player1.text
        var value2 = player2.text
        
        if sender === stepper1For1{
            life1 += sender.value
            sender.value = 0
            value1 = String(Int(life1))
        }
        else if sender === stepper1For2{
            life2 += sender.value
            sender.value = 0
            value2 = String(Int(life2))
            
        }
        else if sender === stepper5For1{
            life1 += sender.value
            sender.value = 0
            value1 = String(Int(life1))
        }
        else if sender === stepper5For2{
            life2 += sender.value
            sender.value = 0
            value2 = String(Int(life2))
        }
        
       let myJSON = [
            "player1": value1!,
            "player2": value2!
        ] as NSDictionary
        
        socket.emit("message", (myJSON as AnyObject))
    }
    
    func addHandlers(){
        // Using a shorthand parameter name for closures
        self.socket.onAny {print("Got event: \($0.event), with items: \($0.items)")}
        
        self.socket.on("message"){[weak self] data, ack in
            print(data)
            
            
            
            if let json = data[0] as? NSDictionary{
                
                self!.player1.text = json["player1"] as? String
                self!.player2.text = json["player2"]! as? String
                
            }
            return
        }
    }
}

