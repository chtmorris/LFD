//
//  LFDMainVC+BackgroundGradients.swift
//  LeftForDead
//
//  Created by Charlie Morris on 29/02/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import UIKit

extension LFDMainVC {
    
    
    // ==============================
    // SETTING UP GRADIENT BACKGROUND
    // ==============================
    
    func addGradientBackground() {
        self.gradientView.backgroundColor = UIColor.blackColor()
        gradientLayer.frame = self.gradientView.bounds
        
        let color1 = UIColor(red: 20/255, green: 0, blue: 116/255, alpha: 1.0).CGColor as CGColorRef
        let color2 = UIColor.blackColor().CGColor as CGColorRef
        gradientLayer.colors = [color1, color2]
        
        gradientLayer.locations = [0.0, 0.55]
        
        //        let color1 = UIColor.yellowColor().CGColor as CGColorRef
        //        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 1.0).CGColor as CGColorRef
        //        let color3 = UIColor.clearColor().CGColor as CGColorRef
        //        let color4 = UIColor(white: 0.0, alpha: 0.7).CGColor as CGColorRef
        //        gradientLayer.colors = [color1, color2, color3, color4]
        //
        //        gradientLayer.locations = [0.0, 0.25, 0.75, 1.0]
        
        self.gradientView.layer.addSublayer(gradientLayer)
    }

    
}