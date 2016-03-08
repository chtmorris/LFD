//
//  ViewController.swift
//  LeftForDead
//
//  Created by Charlie Morris on 22/02/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import UIKit
import Hue

protocol GraphViewController {
    var graph:Graph { get }
    func showNode(nodeId:NodeId)
    func showChoices(choices: [ChoiceAction])
}

final class LFDGraphViewController: UIViewController, GraphViewController {
    
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
//    let gradient = [UIColor.clearColor(), UIColor.blackColor(), UIColor.blackColor()].gradient()
    
    lazy var graph:Graph = {
        LeftForDeadStory(viewController: self)
    }()
    let startingNode: NodeId = "1.001"
    
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
        
//        addGradientBackground()
//        self.view.backgroundColor = UIColor.hex("#140074")
//        changeBackgroundColor("#0FC300", duration: 15, delay: 35)
        showNode(startingNode)
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func showNode(nodeId:NodeId) {
        guard let node = graph.moveToNode(nodeId) else { return }
        
        let indexPath = NSIndexPath(forItem: graph.path.count - 1, inSection: 0)
        self.collectionView.reloadData()
        self.collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.Top, animated: true)
        
        node.runAction()
    }
    
    func showChoices(choices: [ChoiceAction]) {
        if choices.count == 2 {
            self.choiceAButtonLabel.text = choices[0].text
            self.choiceBButtonLabel.text = choices[1].text
            hideButtons(false)
        } else {
            print("More or less than 2 choices returned")
        }
        
    }
    
    // ============
    // USER ACTIONS
    // ============
    
    @IBAction func choiceAtapped(sender: UIButton) {
        // TODO - set story.history to empty [] if restarting story
        
        hideButtons(true)
    }
    
    @IBAction func choiceBtapped(sender: UIButton) {
        // TODO - set story.history to empty [] if restarting story

        hideButtons(true)
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
