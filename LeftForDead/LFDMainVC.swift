//
//  ViewController.swift
//  LeftForDead
//
//  Created by Charlie Morris on 22/02/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import UIKit

class LFDMainVC: UIViewController {
    
    private var machine:StateMachine<LFDMainVC>!
    
    enum StoryState{
        case Beginning, Ch1RouteA, Ch1RouteB, Ch1RouteAA, Ch1RouteAB, Ch1RouteBA, Ch1RouteBB
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        let tx = [
            StoryState.Beginning: [StoryState.Ch1RouteA, StoryState.Ch1RouteB],
            StoryState.Ch1RouteA: [StoryState.Ch1RouteAA, StoryState.Ch1RouteAB],
            StoryState.Ch1RouteB: [StoryState.Ch1RouteBA, StoryState.Ch1RouteBB]
        ]

        machine = StateMachine(initialState: .Beginning, delegate: self, validTransitions: tx)
    }
    
    
    @IBOutlet weak var secondStoryLine: UILabel!
    @IBOutlet weak var thirdStoryLine: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func choice3tapped(sender: UIButton) {
        switch machine.state {
        case .Beginning:
            machine.state = .Ch1RouteA
        case .Ch1RouteA:
            machine.state = .Ch1RouteAA
        case .Ch1RouteB:
            machine.state = .Ch1RouteBA
        default:
            print("Unknown action where state is \(machine.state)")
        }
    }
    
    @IBAction func choice4tapped(sender: UIButton) {
        switch machine.state {
        case .Beginning:
            machine.state = .Ch1RouteB
        case .Ch1RouteA:
            machine.state = .Ch1RouteAB
        case .Ch1RouteB:
            machine.state = .Ch1RouteBB
        default:
            print("Unknown action where state is \(machine.state)")
        }
    }
    
    @IBAction func resetButtonTapped(sender: UIButton) {
        machine.state = .Beginning
        secondStoryLine.text = "Reset"
        thirdStoryLine.text = "Reset"
        print(machine.state)
    }
    
}
