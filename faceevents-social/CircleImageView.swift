//
//  CircleImageView.swift
//  faceevents-social
//
//  Created by Asim Ahmed on 5/4/17.
//  Copyright © 2017 Asim Ahmed. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {


    
    
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width / 2
    }


}
