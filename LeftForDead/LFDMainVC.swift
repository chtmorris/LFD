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
        hideButtons(true)
    }
    
    @IBAction func choiceBtapped(sender: UIButton) {
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
        hideButtons(true)
    }
    
    
    // ==============================
    // SETTING UP GRADIENT BACKGROUND
    // ==============================
    
    func addGradientBackground() {
        self.gradientView.backgroundColor = UIColor.blackColor()
        gradientLayer.frame = self.gradientView.bounds
        
        let color1 = UIColor(red: 20/255, green: 0, blue: 116/255, alpha: 1.0).CGColor as CGColorRef
        let color2 = UIColor.blackColor().CGColor as CGColorRef
        gradientLayer.colors = [color1, color2]
        
        gradientLayer.locations = [0.0, 0.55]
        
//        let color1 = UIColor.yellowColor().CGColor as CGColorRef
//        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 1.0).CGColor as CGColorRef
//        let color3 = UIColor.clearColor().CGColor as CGColorRef
//        let color4 = UIColor(white: 0.0, alpha: 0.7).CGColor as CGColorRef
//        gradientLayer.colors = [color1, color2, color3, color4]
//        
//        gradientLayer.locations = [0.0, 0.25, 0.75, 1.0]
        
        self.gradientView.layer.addSublayer(gradientLayer)
    }
    
    
    // =======
    // HELPERS
    // =======
    
    func feedStorySentencesWithDelay(nextStorySection:Story) {
        for sentence in 0...nextStorySection.storyText.count-1 {
            
            let delay = 0.3 * Double(sentence)
            Helper.delay(delay, closure: { () -> () in
                self.myStory.append(nextStorySection.storyText[sentence])
                let indexPath = NSIndexPath(forItem: self.myStory.count - 1, inSection: 0)
                self.collectionView.reloadData()
                self.collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.Bottom, animated: true)
                
                if sentence == nextStorySection.storyText.count-1{
                    UIView.animateWithDuration(2.5, delay: 2.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                        self.hideButtons(false)
                        }, completion: nil)
                }
                
            })
        }
    }
    
    func hideButtons(hide:Bool){
        choiceAButtonLabel.hidden = hide
        choiceBButtonLabel.hidden = hide
        choiceAButton.hidden = hide
        choiceBButton.hidden = hide
    }
    
}
