//
//  LFDMainVC+collectionView.swift
//  LeftForDead
//
//  Created by Charlie Morris on 29/02/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import UIKit

extension LFDGraphViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // ===============
    // COLLECTION VIEW
    // ===============
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return graph.path.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let node = graph.path[indexPath.row]
        if let node = node as? TextNode {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(LFDNodeCell),
                forIndexPath: indexPath) as! LFDNodeCell
            cell.configure(node.text)
            
            let totalStoryLength = graph.path.count - 1
            if (totalStoryLength - indexPath.row) > 3 {
                UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                    cell.label.alpha = 0.3
                    }, completion: nil)
            } else {
                UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                    let alphaOfText = CGFloat((5 - Double(totalStoryLength - indexPath.row)) / 5)
                    cell.label.alpha = alphaOfText
                    }, completion: nil)
            }
            
            if totalStoryLength == indexPath.row {
                cell.label.alpha = 0
                UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                    cell.label.alpha = 1
                    }, completion: nil)
            }
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(LFDNodeCell), forIndexPath: indexPath)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 115)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenHeight = screenSize.height
        return UIEdgeInsetsMake(0, 0, screenHeight/7, 0)
    }

}