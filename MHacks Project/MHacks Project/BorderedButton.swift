//
//  BorderedButton.swift
//  MHacks Project
//
//  Created by Jamal E. Kharrat on 1/17/15.
//  Copyright (c) 2015 Jamal E. Kharrat. All rights reserved.
//

import UIKit

@IBDesignable class UIBorderedButton : UIButton {
    
    @IBInspectable var cornerRadius : CGFloat = 0.0 {
        didSet {
            updateUI()
        }
    }
    
    @IBInspectable var borderColor : UIColor = UIColor.clearColor() {
        didSet {
            updateUI()
        }
    }
    
    
    @IBInspectable var borderWidth : CGFloat = 0.0 {
        didSet{
            updateUI()
        }
    }
    
    
    
    func updateUI() {
        self.layer.borderColor = self.borderColor.CGColor
        self.layer.cornerRadius = self.cornerRadius
        self.layer.borderWidth = self.borderWidth
    }
    
    
}

@IBDesignable class JKCustomTextField : UITextField {
    
    @IBInspectable var cornerRadius : CGFloat = 0.0 {
        didSet {
            updateUI()
        }
    }
    
    @IBInspectable var borderColor : UIColor = UIColor.clearColor() {
        didSet {
            updateUI()
        }
    }
    
    @IBInspectable var placeholderTextColor : UIColor = UIColor.blackColor() {
        didSet {
            updateUI()
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0.0 {
        didSet{
            updateUI()
        }
    }
    
    
    func updateUI() {
        if self.respondsToSelector("setAttributedPlaceholder:") {
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: [NSForegroundColorAttributeName : placeholderTextColor])
        }
        self.layer.borderColor = self.borderColor.CGColor
        self.layer.cornerRadius = self.cornerRadius
        self.layer.borderWidth = self.borderWidth
        self.clipsToBounds = true
    }
    
}
