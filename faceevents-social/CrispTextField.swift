//
//  CrispTextField.swift
//  faceevents-social
//
//  Created by Asim Ahmed on 5/3/17.
//  Copyright © 2017 Asim Ahmed. All rights reserved.
//

import UIKit

class CrispTextField: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.2).cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 2.0
        
        
        
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.insetBy(dx: 10, dy: 5)
        
    }
    
    override func  editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }

}
