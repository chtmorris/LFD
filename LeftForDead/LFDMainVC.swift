//
//  ViewController.swift
//  LeftForDead
//
//  Created by Charlie Morris on 22/02/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import UIKit
import Hue

class LFDMainVC: UIViewController {
    
    // =========
    // VARIABLES
    // =========
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var choiceAButtonLabel: UILabel!
    @IBOutlet weak var choiceBButtonLabel: UILabel!
    @IBOutlet weak var choiceAButton: UIButton!
    @IBOutlet weak var choiceBButton: UIButton!
    
    @IBOutlet weak var gradientView: UIView!
    let gradientLayer = CAGradientLayer()
    let gradient = [UIColor.clearColor(), UIColor.blackColor(), UIColor.blackColor()].gradient()

    private var machine:StateMachine<LFDMainVC>!
    var myStory: [String] = []
    
    
    // ==================
    // STATEMACHINE SETUP
    // ==================
    
    enum StoryState{
        case Beginning, Ch1RouteA, Ch1RouteAA, Ch1RouteAAA, Ch1RouteAAB, Ch1RouteAB, Ch1RouteB, Ch1RouteBA, Ch1RouteBAA, Ch1RouteBAB, Ch1RouteBB
    }
    
    var currentStoryState:StoryState = .Beginning
    var decisionAStoryState:StoryState = .Beginning
    var decisionBStoryState:StoryState = .Beginning
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        let tx = [
            StoryState.Beginning: [StoryState.Ch1RouteA, StoryState.Ch1RouteB],
            StoryState.Ch1RouteA: [StoryState.Ch1RouteAA, StoryState.Ch1RouteAB],
            StoryState.Ch1RouteAA: [StoryState.Ch1RouteAAA, StoryState.Ch1RouteAAB],
            StoryState.Ch1RouteAB: [StoryState.Ch1RouteB],
            StoryState.Ch1RouteAAA: [StoryState.Ch1RouteB],
            StoryState.Ch1RouteAAB: [StoryState.Ch1RouteB],
            StoryState.Ch1RouteB: [StoryState.Ch1RouteBA, StoryState.Ch1RouteBB],
            StoryState.Ch1RouteBA: [StoryState.Ch1RouteBAA, StoryState.Ch1RouteBAB],
            StoryState.Ch1RouteBAB: [StoryState.Beginning],
            StoryState.Ch1RouteBAA: [StoryState.Beginning],
            StoryState.Ch1RouteBB: [StoryState.Beginning]
        ]

        machine = StateMachine(initialState: .Beginning, delegate: self, validTransitions: tx)
    }
    
    
    // ============
    // VC LIFECYCLE
    // ============
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        hideButtons(true)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        addGradientBackground()
        self.view.backgroundColor = UIColor.hex("#140074")
        
        changeBackgroundColor("#0FC300", duration: 15, delay: 35)
        
        feedStorySentencesWithDelay(Story.Beginning)
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    
    // ============
    // USER ACTIONS
    // ============
    
    @IBAction func choiceAtapped(sender: UIButton) {
        
        machine.state = currentStoryState
        
        choiceASelected()
        hideButtons(true)
    }
    
    @IBAction func choiceBtapped(sender: UIButton) {
        choiceBSelected()
        hideButtons(true)
    }
    
    
    // ==========
    // STORY FLOW
    // ==========
    
    func choiceASelected() {
        switch machine.state {
        case .Beginning:
            machine.state = .Ch1RouteA
        case .Ch1RouteA:
            machine.state = .Ch1RouteAA
        case .Ch1RouteAA:
            machine.state = .Ch1RouteAAA
        case .Ch1RouteAAA:
            machine.state = .Ch1RouteB
        case .Ch1RouteAAB:
            machine.state = .Ch1RouteB
        case .Ch1RouteAB:
            machine.state = .Ch1RouteB
        case .Ch1RouteB:
            machine.state = .Ch1RouteBA
        case .Ch1RouteBA:
            machine.state = .Ch1RouteBAA
        case .Ch1RouteBAA:
            machine.state = .Beginning
        case .Ch1RouteBAB:
            machine.state = .Beginning
        case .Ch1RouteBB:
            machine.state = .Beginning
        }
    }
    
    func choiceBSelected() {
        switch machine.state {
        case .Beginning:
            machine.state = .Ch1RouteB
        case .Ch1RouteA:
            machine.state = .Ch1RouteAB
        case .Ch1RouteAA:
            machine.state = .Ch1RouteAAB
        case .Ch1RouteAAA:
            machine.state = .Ch1RouteB
        case .Ch1RouteAAB:
            machine.state = .Ch1RouteB
        case .Ch1RouteAB:
            machine.state = .Ch1RouteB
        case .Ch1RouteB:
            machine.state = .Ch1RouteBB
        case .Ch1RouteBA:
            machine.state = .Ch1RouteBAB
        case .Ch1RouteBAA:
            machine.state = .Beginning
        case .Ch1RouteBAB:
            machine.state = .Beginning
        case .Ch1RouteBB:
            machine.state = .Beginning
        }
    }
    
    
    // =======
    // HELPERS
    // =======
    
    func feedStorySentencesWithDelay(nextStorySection:Story) {
    
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
//                    self.decisionAStoryState = sentence.decisionARoute
                    
                    
                    Helper.delay(1.0, closure: { () -> () in
                        if nextStorySection.decisionA.text == "NO CHOICE" {
                            self.choiceASelected()
                        } else {
                            UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                                self.hideButtons(false)
                                }, completion: nil)
                        }
                    })
                }
                
                // DELAY BEFORE SHOWING NEXT SENTENCE
                let delayInSeconds = 0.2
//                let delayInSeconds = sentence.delay
                Helper.delay(delayInSeconds) {
                    showSentence()
                } 
            }
        }
        
        showSentence()

    }
    
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
