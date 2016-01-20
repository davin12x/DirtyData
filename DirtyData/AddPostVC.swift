//
//  AddPostVC.swift
//  DirtyData
//
//  Created by Lalit on 2016-01-19.
//  Copyright © 2016 Bagga. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        pImage.layer.cornerRadius = pImage.frame.size.width / 2
        pImage.clipsToBounds = true
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self

    }
    @IBOutlet weak var pImage: UIImageView!

    @IBOutlet weak var descriptions: UITextField!
    
    @IBOutlet weak var titles: UITextField!
    
    @IBAction func onCancelPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onAddPic(sender: UIButton!) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }


    
    @IBAction func makePostButtonPressed(sender: AnyObject){
        if let desc = descriptions.text, let title = titles.text, let img = pImage.image{
            let imagePath = DataServices.instance.saveImageAndCreatePath(img)
            let post = Post(title: title, imagePath: imagePath, postDesc: desc)
            DataServices.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
            
        }
    
    
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        pImage.image = image
        
    }
   

}
