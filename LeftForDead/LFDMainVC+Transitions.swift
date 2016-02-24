//
//  LFDMainVC+Transitions.swift
//  LeftForDead
//
//  Created by Charlie Morris on 23/02/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import UIKit

extension LFDMainVC: StateMachineDelegateProtocol, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // ===============
    // COLLECTION VIEW
    // ===============
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myStory.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("StoryTextCell", forIndexPath: indexPath)
        if let cell = cell as? LFDStoryTextCell {
            cell.configure(myStory[indexPath.row].storyText!)
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 300)
    }
    
    
    // =================
    // STATE TRANSITIONS
    // =================
    
    typealias StateType = StoryState
    
    func didTransitionFrom(from: StateType, to: StateType) {
        switch (from, to) {
        case (.Beginning, .Ch1RouteA):
           setStoryAndButtonText(Story.Ch1RouteA)
        case (.Beginning, .Ch1RouteB):
            setStoryAndButtonText(Story.Ch1RouteB)
        
        case (.Ch1RouteA, .Ch1RouteAA):
            setStoryAndButtonText(Story.Ch1RouteAA)
        case (.Ch1RouteAA, .Ch1RouteAAA):
            setStoryAndButtonText(Story.Ch1RouteAAA)
        case (.Ch1RouteAA, .Ch1RouteAAB):
            setStoryAndButtonText(Story.Ch1RouteAAB)
        case (.Ch1RouteAAA, .Ch1RouteB):
            setStoryAndButtonText(Story.Ch1RouteB)
        case (.Ch1RouteAAB, .Ch1RouteB):
            setStoryAndButtonText(Story.Ch1RouteB)
        case (.Ch1RouteA, .Ch1RouteAB):
            setStoryAndButtonText(Story.Ch1RouteAB)
        case (.Ch1RouteAB, .Ch1RouteB):
            setStoryAndButtonText(Story.Ch1RouteB)
        
        case (.Ch1RouteB, .Ch1RouteBA):
            setStoryAndButtonText(Story.Ch1RouteBA)
        case (.Ch1RouteBA, .Ch1RouteBAA):
            setStoryAndButtonText(Story.Ch1RouteBAA)
        case (.Ch1RouteBA, .Ch1RouteBAB):
            setStoryAndButtonText(Story.Ch1RouteBAB)

        case (.Ch1RouteB, .Ch1RouteBB):
            setStoryAndButtonText(Story.Ch1RouteBB)
        default:
            break
        }
    }
    
    
    // =======
    // HELPERS
    // =======
    
    func updateCollectionView(storyText:String) {
        myStory.append(MyStory(storyText: storyText))
        let indexPath = NSIndexPath(forItem: myStory.count - 1, inSection: 0)
        collectionView.insertItemsAtIndexPaths([indexPath])
        collectionView.reloadData()
        collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.Top, animated: true)
    }

    func setStoryAndButtonText(storyRoute:Story) {
        updateCollectionView(storyRoute.storyText)
        choiceAButtonLabel.text = storyRoute.buttonATitle
        choiceBButtonLabel.text = storyRoute.buttonBTitle
    }
    
}