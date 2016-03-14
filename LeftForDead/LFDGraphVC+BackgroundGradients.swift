//
//  LFDMainVC+BackgroundGradients.swift
//  LeftForDead
//
//  Created by Charlie Morris on 29/02/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import UIKit

extension LFDGraphViewController {
    
    
    // ==============================
    // SETTING UP GRADIENT BACKGROUND
    // ==============================
    
//    func addGradientBackground() {
//        gradient.bounds = self.view.bounds
//        gradient.frame = self.gradientView.bounds
//        
//        self.gradientView.layer.addSublayer(self.gradient)
//    }
    
    func changeBackgroundColor(hexColor:String, duration: NSTimeInterval, delay:NSTimeInterval) {
        UIView.animateWithDuration(duration, delay: delay, options: .CurveLinear, animations: {
            self.view.backgroundColor = UIColor.hex(hexColor)
            }, completion: nil)
    }
    
}