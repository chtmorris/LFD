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
            updateCollectionView(Story.Ch1RouteA.storyText, chapter: 1)
        case (.Beginning, .Ch1RouteB):
            updateCollectionView(Story.Ch1RouteB.storyText, chapter: 1)
        
        case (.Ch1RouteA, .Ch1RouteAA):
            updateCollectionView(Story.Ch1RouteAA.storyText, chapter: 1)
        case (.Ch1RouteAA, .Ch1RouteAAA):
            updateCollectionView(Story.Ch1RouteAAA.storyText, chapter: 1)
        case (.Ch1RouteAA, .Ch1RouteAAB):
            updateCollectionView(Story.Ch1RouteAAB.storyText, chapter: 1)
        case (.Ch1RouteAAA, .Ch1RouteB):
            updateCollectionView(Story.Ch1RouteB.storyText, chapter: 1)
        case (.Ch1RouteAAB, .Ch1RouteB):
            updateCollectionView(Story.Ch1RouteB.storyText, chapter: 1)
        case (.Ch1RouteA, .Ch1RouteAB):
            updateCollectionView(Story.Ch1RouteAB.storyText, chapter: 1)
        case (.Ch1RouteAB, .Ch1RouteB):
            updateCollectionView(Story.Ch1RouteB.storyText, chapter: 1)
        
        case (.Ch1RouteB, .Ch1RouteBA):
            updateCollectionView(Story.Ch1RouteBA.storyText, chapter: 1)
        case (.Ch1RouteBA, .Ch1RouteBAA):
            updateCollectionView(Story.Ch1RouteBAA.storyText, chapter: 1)
        case (.Ch1RouteBA, .Ch1RouteBAB):
            updateCollectionView(Story.Ch1RouteBAB.storyText, chapter: 1)

        case (.Ch1RouteB, .Ch1RouteBB):
            updateCollectionView(Story.Ch1RouteAB.storyText, chapter: 1)
        default:
            break
        }
    }
    
    
    // =======
    // HELPERS
    // =======
    
    func updateCollectionView(storyText:String, chapter:Int) {
        myStory.append(MyStory(storyText: storyText, chapter: 1))
        let indexPath = NSIndexPath(forItem: myStory.count - 1, inSection: 0)
        collectionView.insertItemsAtIndexPaths([indexPath])
        collectionView.reloadData()
        collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.Top, animated: true)
//        self.collectionView?.scrollToItemAtIndexPath(lastItemIndex, atScrollPosition: UICollectionViewScrollPosition.Top, animated: false)
    }
    
    
    
}