//
//  ViewController.swift
//  CameraApp
//
//  Created by Ayush verma on 10/02/20.
//  Copyright © 2020 Ayush verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var captureButton: customButton!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
    }

    
    func cameraView(){
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera)){
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            imagePicker.showsCameraControls = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        else{
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func galleryView(){
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        picker.dismiss(animated: true)
        let image = info[.originalImage] as! UIImage
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
    }
    
    @IBAction func cameraButtonPressed(_ sender: Any) {
        
        let permission = UIAlertController(title: "Select Mode", message: "select a mode you want to set profile picture", preferredStyle: .actionSheet)
        
        let cameraOption = UIAlertAction(title: "Camera", style: .default) { (_) in
            //call the camera option here
            self.cameraView()
        }
        
        let galleryOption = UIAlertAction(title: "Gallery", style: .default) { (_) in
            //call the galley option here.
            self.galleryView()
        }
        
        //add both the action type to the controller
        permission.addAction(cameraOption)
        permission.addAction(galleryOption)
        
        
        //present the permissionViewController from here
        present(permission, animated: true, completion: nil)
    }
}
