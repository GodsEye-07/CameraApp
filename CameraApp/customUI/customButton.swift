//
//  customButton.swift
//  CameraApp
//
//  Created by Ayush verma on 10/02/20.
//  Copyright © 2020 Ayush verma. All rights reserved.
//

import UIKit

@IBDesignable
class customButton: UIButton {
    
    @IBInspectable var cornerRadius:CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth:CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor:UIColor = UIColor.white{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
