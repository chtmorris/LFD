//
//  LFDStoryModel.swift
//  LeftForDead
//
//  Created by Charlie Morris on 23/02/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import Foundation

enum Story {
    case Beginning, Ch1RouteA, Ch1RouteB, Ch1RouteAA, Ch1RouteAB, Ch1RouteBA, Ch1RouteBB
    
    var storyText: String {
        switch self{
        case .Beginning:
            return "This is the begginning of the story"
        case .Ch1RouteA:
            return "Choice 1 selected"
        case .Ch1RouteB:
            return "Choice 2 selected"
        case .Ch1RouteAA:
            return "Choice 1 selected then 1 again"
        case .Ch1RouteAB:
            return "Choice 1 selected then 2"
        case .Ch1RouteBA:
            return "Choice 2 selected then 1"
        case .Ch1RouteBB:
            return "Choice 2 selected then 2"
        }
    }
}