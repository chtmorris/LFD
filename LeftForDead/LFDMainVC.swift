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
    
    var myStory: [String] = []
    var currentStoryState:Story = .Beginning
    var decisionAStoryState:Story = .Beginning
    var decisionBStoryState:Story = .Beginning
    

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
        
        feedStorySentences(Story.Beginning)
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    
    // ============
    // USER ACTIONS
    // ============
    
    @IBAction func choiceAtapped(sender: UIButton) {
        if decisionAStoryState == .Beginning {
            myStory = []
        }
        
        feedStorySentences(decisionAStoryState)
        hideButtons(true)
    }
    
    @IBAction func choiceBtapped(sender: UIButton) {
        if decisionBStoryState == .Beginning {
            myStory = []
        }
        
        feedStorySentences(decisionBStoryState)
        hideButtons(true)
    }
    
}
