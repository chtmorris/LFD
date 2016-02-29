//
//  ViewController.swift
//  LeftForDead
//
//  Created by Charlie Morris on 22/02/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import UIKit

class LFDMainVC: UIViewController {
    
    
    // =========
    // VARIABLES
    // =========
    
    let gradientLayer = CAGradientLayer()
    @IBOutlet weak var gradientView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var choiceAButtonLabel: UILabel!
    @IBOutlet weak var choiceBButtonLabel: UILabel!
    @IBOutlet weak var choiceAButton: UIButton!
    @IBOutlet weak var choiceBButton: UIButton!
    
    private var machine:StateMachine<LFDMainVC>!
    var myStory: [String] = []
    

    // ==================
    // STATEMACHINE SETUP
    // ==================
    
    enum StoryState{
        case Beginning, Ch1RouteA, Ch1RouteAA, Ch1RouteAAA, Ch1RouteAAB, Ch1RouteAB, Ch1RouteB, Ch1RouteBA, Ch1RouteBAA, Ch1RouteBAB, Ch1RouteBB
    }
    
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
            StoryState.Ch1RouteBA: [StoryState.Ch1RouteBAA, StoryState.Ch1RouteBAB]
        ]

        machine = StateMachine(initialState: .Beginning, delegate: self, validTransitions: tx)
    }
    
    
    // ============
    // VC LIFECYCLE
    // ============
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradientBackground()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        hideButtons(true)
        feedStorySentencesWithDelay(Story.Beginning)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    
    // ============
    // USER ACTIONS
    // ============
    
    @IBAction func choiceAtapped(sender: UIButton) {
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
        default:
            print("Unknown action where state is \(machine.state)")
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
        default:
            print("Unknown action where state is \(machine.state)")
        }
    }
    
    
    // =======
    // HELPERS
    // =======
    
    func feedStorySentencesWithDelay(nextStorySection:Story) {
        for sentence in 0...nextStorySection.storyText.count-1 {
            
//            let characterCount = Double(nextStorySection.storyText[sentence].characters.count)
//            let delay = (1 + characterCount/50) * Double(sentence)

            let delay = 2.0 * Double(sentence)
            Helper.delay(delay, closure: { () -> () in
                self.myStory.append(nextStorySection.storyText[sentence])
                let indexPath = NSIndexPath(forItem: self.myStory.count - 1, inSection: 0)
                self.collectionView.reloadData()
                self.collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.Top, animated: true)
                
                if sentence == nextStorySection.storyText.count-1 {
                    
                    Helper.delay(1.0, closure: { () -> () in
                        if nextStorySection.buttonATitle == "NO CHOICE" {
                            print("No choice navigated through")
                            self.choiceASelected()
                        } else {
                            UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                                self.hideButtons(false)
                                }, completion: nil)
                        }
                    })
                }
                
            })
        }
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
