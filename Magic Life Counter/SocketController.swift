//
//  SocketController.swift
//  Magic Life Counter
//
//  Created by Erica Clark on 7/20/16.
//  Copyright © 2016 Clark. All rights reserved.
//

import Foundation

class SocketController{
    
    //MARK: Wrapped Socket
    let socket = SocketIOClient(socketURL: NSURL(string:"http://192.168.2.7:8000")!)
    
    

}