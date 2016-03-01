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
            self.setStoryAndButtonText(Story.Ch1RouteA)
        case (.Beginning, .Ch1RouteB):
            myStory.append("DECISION MADE:\n\(Story.Beginning.buttonBTitle)")
            setStoryAndButtonText(Story.Ch1RouteB)
        
        // CHAPTER 1 - ROUTE A
        case (.Ch1RouteA, .Ch1RouteAA):
            myStory.append("DECISION MADE:\n\(Story.Ch1RouteA.buttonATitle)")
            setStoryAndButtonText(Story.Ch1RouteAA)
        case (.Ch1RouteAA, .Ch1RouteAAA):
            myStory.append("DECISION MADE:\n\(Story.Ch1RouteAA.buttonATitle)")
            setStoryAndButtonText(Story.Ch1RouteAAA)
        case (.Ch1RouteAA, .Ch1RouteAAB):
            myStory.append("DECISION MADE:\n\(Story.Ch1RouteAA.buttonBTitle)")
            setStoryAndButtonText(Story.Ch1RouteAAB)
        case (.Ch1RouteAAA, .Ch1RouteB):
            setStoryAndButtonText(Story.Ch1RouteB)
        case (.Ch1RouteAAB, .Ch1RouteB):
            setStoryAndButtonText(Story.Ch1RouteB)
        case (.Ch1RouteA, .Ch1RouteAB):
            myStory.append("DECISION MADE:\n\(Story.Ch1RouteA.buttonBTitle)")
            setStoryAndButtonText(Story.Ch1RouteAB)
        case (.Ch1RouteAB, .Ch1RouteB):
            setStoryAndButtonText(Story.Ch1RouteB)
        
        // CHAPTER 1 - ROUTE B
        case (.Ch1RouteB, .Ch1RouteBA):
            myStory.append("DECISION MADE:\n\(Story.Ch1RouteB.buttonATitle)")
            setStoryAndButtonText(Story.Ch1RouteBA)
        case (.Ch1RouteBA, .Ch1RouteBAA):
            myStory.append("DECISION MADE:\n\(Story.Ch1RouteBA.buttonATitle)")
            setStoryAndButtonText(Story.Ch1RouteBAA)
        case (.Ch1RouteBA, .Ch1RouteBAB):
            myStory.append("DECISION MADE:\n\(Story.Ch1RouteBA.buttonBTitle)")
            setStoryAndButtonText(Story.Ch1RouteBAB)

        case (.Ch1RouteB, .Ch1RouteBB):
            myStory.append("DECISION MADE:\n\(Story.Ch1RouteB.buttonBTitle)")
            setStoryAndButtonText(Story.Ch1RouteBB)
        
        // CHAPTER 1 - ROUTE B - FINISH
        case (.Ch1RouteBAA, .Beginning):
            myStory = []
            setStoryAndButtonText(Story.Beginning)
        case (.Ch1RouteBAB, .Beginning):
            myStory = []
            setStoryAndButtonText(Story.Beginning)
        case (.Ch1RouteBB, .Beginning):
            myStory = []
            setStoryAndButtonText(Story.Beginning)
            
        default:
            break
        }
    }
    
    
    // =======
    // HELPERS
    // =======

    func setStoryAndButtonText(storyRoute:Story) {
        collectionView.reloadData()
        Helper.delay(1.0, closure: { () -> () in
            self.feedStorySentencesWithDelay(storyRoute)
            self.choiceAButtonLabel.text = storyRoute.buttonATitle
            self.choiceBButtonLabel.text = storyRoute.buttonBTitle
        })
    }
    
}