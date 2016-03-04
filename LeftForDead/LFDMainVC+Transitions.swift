//
//  LFDMainVC+Transitions.swift
//  LeftForDead
//
//  Created by Charlie Morris on 23/02/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import UIKit

extension LFDMainVC {
    
    // ====================
    // FEED STORY TO READER
    // ====================
    
    func feedStorySentences(nextStorySection:Story) {
        
        if nextStorySection != Story.Beginning {
            self.changeBackgroundColor(nextStorySection.backgroundColor, duration: 10, delay: 3)
        }
        
        var paragraph = Paragraph(sentences: nextStorySection.storyText)
        
        func showSentence() {
            if let sentence = paragraph.nextSentence() {
                
                // ADD SENTENCE TO MYSTORY
                self.myStory.append(sentence.text)
                let indexPath = NSIndexPath(forItem: self.myStory.count - 1, inSection: 0)
                self.collectionView.reloadData()
                self.collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.Top, animated: true)
                
                // DEAL WITH LAST SENTENCE OPTIONS
                if sentence.specialAttribute == "last sentence" {
                    
                    self.choiceAButtonLabel.text = sentence.decisionAText
                    self.choiceBButtonLabel.text = sentence.decisionBText
                    self.decisionAStoryState = sentence.decisionARoute!
                    self.decisionBStoryState = sentence.decisionBRoute!
                    
                    
                    Helper.delay(1.0, closure: { () -> () in
                        if sentence.decisionAText == "NO CHOICE" {
                            self.feedStorySentences(self.decisionAStoryState)
                        } else {
                            UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                                self.hideButtons(false)
                                }, completion: nil)
                        }
                    })
                    
                }
                
                // DELAY BEFORE SHOWING NEXT SENTENCE
                //                let delayInSeconds = 0.2
                let delayInSeconds = sentence.delay
                Helper.delay(delayInSeconds) {
                    showSentence()
                }
            }
        }
        
        showSentence()
        
    }
    
    
    // =======
    // HELPERS
    // =======
    
    func hideButtons(hide:Bool){
        if hide == true {
            choiceAButtonLabel.alpha = 0
            choiceBButtonLabel.alpha = 0
        } else {
            choiceAButtonLabel.alpha = 1
            choiceBButtonLabel.alpha = 1
        }
        
        choiceAButton.hidden = hide
        choiceBButton.hidden = hide
    }

    
}