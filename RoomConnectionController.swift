//
//  RoomConnectionController.swift
//  Magic Life Counter
//
//  Created by Erica Clark on 7/20/16.
//  Copyright © 2016 Clark. All rights reserved.
//

import UIKit

class RoomConnectionController : UIViewController{
    
    //MARK: Properties
    var player1 : String?
    var player2 : String?
    @IBOutlet weak var player1Name: UITextField!
    @IBOutlet weak var player2Name: UITextField!
    let socket = SocketIOClient(socketURL: NSURL(string:"http://192.168.13.1:8000")!)
    var gameID : String?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.addHandlers()
        self.socket.connect()
        //self.socket.emit("connected",(JSON as AnyObject))
    }
    
    func addHandlers(){
        // Using a shorthand parameter name for closures
        self.socket.onAny {print("Got event: \($0.event), with items: \($0.items)")}
        self.socket.on("connection", callback: connected)
        self.socket.on("gameID", callback: startGame)
    }
    
    func connected(arr : Array<AnyObject>, ackEmitter : SocketAckEmitter){
        let JSON = [
            "playerName" : "Erica"
            ] as NSDictionary
        
        self.socket.emit("connected",(JSON as AnyObject))
    }
    
    func startGame(arr : Array<AnyObject>, ackEmitter : SocketAckEmitter){
        //do this next
    }
    
    @IBAction func addPlayer(sender: UITextField) {
        if sender == player1Name{
            player1 = player1Name.text
        }
        else if sender == player2Name{
            player2 = player2Name.text
        }
    }
    
    @IBAction func done(sender: AnyObject) {
        if player1 != nil && player2 != nil{
            //send request to get id for room
            
            let JSON = [
                "player1Name" : player1!,
                "player2Name" : player2!
            ] as NSDictionary
            
            socket.emit("setupRoom", (JSON as AnyObject))
           
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! ViewController
        
        destination.gameID = self.gameID
    }
}