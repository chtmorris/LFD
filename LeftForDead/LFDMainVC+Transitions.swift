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
            secondStoryLine.text = Story.Ch1RouteA.storyText
        case (.Beginning, .Ch1RouteB):
            secondStoryLine.text = Story.Ch1RouteB.storyText
        case (.Ch1RouteA, .Ch1RouteAA):
            thirdStoryLine.text = Story.Ch1RouteAA.storyText
        case (.Ch1RouteA, .Ch1RouteAB):
            thirdStoryLine.text = Story.Ch1RouteAB.storyText
        case (.Ch1RouteB, .Ch1RouteBA):
            thirdStoryLine.text = Story.Ch1RouteBA.storyText
        case (.Ch1RouteB, .Ch1RouteBB):
            thirdStoryLine.text = Story.Ch1RouteAB.storyText
        default:
            break
        }
    }
    
}