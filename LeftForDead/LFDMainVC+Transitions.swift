//
//  LFDMainVC+Transitions.swift
//  LeftForDead
//
//  Created by Charlie Morris on 23/02/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import UIKit

extension LFDMainVC: StateMachineDelegateProtocol {
    
    
    // =================
    // STATE TRANSITIONS
    // =================
    
    typealias StateType = StoryState
    
    func didTransitionFrom(from: StateType, to: StateType) {
        switch (from, to) {
            
        // BEGINNING
        case (.Beginning, .Ch1RouteA):
            myStory.append("DECISION MADE:\n\(Story.Beginning.buttonATitle)")
            self.setStoryButtonAndBackground(Story.Ch1RouteA)

        case (.Beginning, .Ch1RouteB):
            myStory.append("DECISION MADE:\n\(Story.Beginning.buttonBTitle)")
            setStoryButtonAndBackground(Story.Ch1RouteB)
        
        // CHAPTER 1 - ROUTE A
        case (.Ch1RouteA, .Ch1RouteAA):
            myStory.append("DECISION MADE:\n\(Story.Ch1RouteA.buttonATitle)")
            setStoryButtonAndBackground(Story.Ch1RouteAA)
        case (.Ch1RouteAA, .Ch1RouteAAA):
            myStory.append("DECISION MADE:\n\(Story.Ch1RouteAA.buttonATitle)")
            setStoryButtonAndBackground(Story.Ch1RouteAAA)
        case (.Ch1RouteAA, .Ch1RouteAAB):
            myStory.append("DECISION MADE:\n\(Story.Ch1RouteAA.buttonBTitle)")
            setStoryButtonAndBackground(Story.Ch1RouteAAB)
        case (.Ch1RouteAAA, .Ch1RouteB):
            setStoryButtonAndBackground(Story.Ch1RouteB)
        case (.Ch1RouteAAB, .Ch1RouteB):
            setStoryButtonAndBackground(Story.Ch1RouteB)
        case (.Ch1RouteA, .Ch1RouteAB):
            myStory.append("DECISION MADE:\n\(Story.Ch1RouteA.buttonBTitle)")
            setStoryButtonAndBackground(Story.Ch1RouteAB)
        case (.Ch1RouteAB, .Ch1RouteB):
            setStoryButtonAndBackground(Story.Ch1RouteB)
        
        // CHAPTER 1 - ROUTE B
        case (.Ch1RouteB, .Ch1RouteBA):
            myStory.append("DECISION MADE:\n\(Story.Ch1RouteB.buttonATitle)")
            setStoryButtonAndBackground(Story.Ch1RouteBA)
        case (.Ch1RouteBA, .Ch1RouteBAA):
            myStory.append("DECISION MADE:\n\(Story.Ch1RouteBA.buttonATitle)")
            setStoryButtonAndBackground(Story.Ch1RouteBAA)
        case (.Ch1RouteBA, .Ch1RouteBAB):
            myStory.append("DECISION MADE:\n\(Story.Ch1RouteBA.buttonBTitle)")
            setStoryButtonAndBackground(Story.Ch1RouteBAB)

        case (.Ch1RouteB, .Ch1RouteBB):
            myStory.append("DECISION MADE:\n\(Story.Ch1RouteB.buttonBTitle)")
            setStoryButtonAndBackground(Story.Ch1RouteBB)
        
        // CHAPTER 1 - ROUTE B - FINISH
        case (.Ch1RouteBAA, .Beginning):
            myStory = []
            setStoryButtonAndBackground(Story.Beginning)
        case (.Ch1RouteBAB, .Beginning):
            myStory = []
            setStoryButtonAndBackground(Story.Beginning)
        case (.Ch1RouteBB, .Beginning):
            myStory = []
            setStoryButtonAndBackground(Story.Beginning)
            
        default:
            break
        }
    }
    
    
    // =======
    // HELPERS
    // =======

    func setStoryButtonAndBackground(storyRoute:Story) {
        collectionView.reloadData()
        Helper.delay(1.0, closure: { () -> () in
            self.feedStorySentencesWithDelay(storyRoute)
            self.choiceAButtonLabel.text = storyRoute.buttonATitle
            self.choiceBButtonLabel.text = storyRoute.buttonBTitle
        })
        self.changeBackgroundColor(storyRoute.backgroundColor, duration: 10, delay: 3)
    }
    
}