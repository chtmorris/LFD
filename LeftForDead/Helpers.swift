//
//  Helpers.swift
//  LeftForDead
//
//  Created by Charlie Morris on 24/02/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import Foundation
import UIKit

class Helper{
    
    static func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
}
