//
//  DeckProfile.swift
//  Magic Life Counter
//
//  Created by Erica Clark on 7/6/16.
//  Copyright © 2016 Clark. All rights reserved.
//

import UIKit

class DeckProfile: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    //MARK: Properties
    
    @IBOutlet weak var deckName: UITextField!
    @IBOutlet weak var deckPhoto: UIImageView!
    
    
    //MARK: Overridden methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Action
    
    @IBAction func tapOnPhoto(sender: UITapGestureRecognizer){
       //dismiss the keybboard
        deckName.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
       
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        deckPhoto.image = selectedImage
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: SocketIO
    

}