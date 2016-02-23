//
//  LFDMainVC+Transitions.swift
//  LeftForDead
//
//  Created by Charlie Morris on 23/02/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import UIKit

extension LFDMainVC: StateMachineDelegateProtocol {
    
    typealias StateType = StoryState
    
    func didTransitionFrom(from: StateType, to: StateType) {
        switch (from, to) {
        case (.Beginning, .Ch1RouteA):
            secondStoryLine.text = "Choice 1 selected"
        case (.Beginning, .Ch1RouteB):
            secondStoryLine.text = "Choice 2 selected"
        case (.Ch1RouteA, .Ch1RouteAA):
            thirdStoryLine.text = "Choice 1 then 1 selected"
        case (.Ch1RouteA, .Ch1RouteAB):
            thirdStoryLine.text = "Choice 1 then 2 selected"
        case (.Ch1RouteB, .Ch1RouteBA):
            thirdStoryLine.text = "Choice 2 then 1 selected"
        case (.Ch1RouteB, .Ch1RouteBB):
            thirdStoryLine.text = "Choice 2 then 2 selected"
        default:
            break
        }
    }
    
}