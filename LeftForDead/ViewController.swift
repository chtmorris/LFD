//
//  ViewController.swift
//  LeftForDead
//
//  Created by Charlie Morris on 22/02/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, StateMachineDelegateProtocol {
    
    var machine:StateMachine<ViewController>!
    
    enum StoryState{
        case Beginning, Ch1RouteA, Ch1RouteB, Ch1RouteAA, Ch1RouteAB, Ch1RouteBA, Ch1RouteBB
    }

    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        machine = StateMachine(initialState: .Beginning, delegate: self)
    }

    typealias StateType = StoryState
    
    
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

    
    func shouldTransitionFrom(from: StateType, to: StateType) -> Bool {
        switch (from, to) {
        case (.Beginning, .Ch1RouteA):
            return true
        case (.Beginning, .Ch1RouteB):
            return true
        case (.Ch1RouteA, .Ch1RouteAA):
            return true
        case (.Ch1RouteA, .Ch1RouteAB):
            return true
        case (.Ch1RouteB, .Ch1RouteBA):
            return true
        case (.Ch1RouteB, .Ch1RouteBB):
            return true
        default:
            return false
        }
    }
    
    func didTransitionFrom(from: StateType, to: StateType) {
        switch (from, to) {
        case (.Beginning, .Ch1RouteA):
            secondStoryLine.text = "Choice 1 selected"
        case (.Beginning, .Ch1RouteB):
            secondStoryLine.text = "Choice 2 selected"
        case (.Ch1RouteA, .Ch1RouteAA):
            thirdStoryLine.text = "Choice 1 then 1 selected"
        case (.Ch1RouteA, .Ch1RouteAB):
            thirdStoryLine.text = "Choice 1 then 2 selected"
        case (.Ch1RouteB, .Ch1RouteBA):
            thirdStoryLine.text = "Choice 2 then 1 selected"
        case (.Ch1RouteB, .Ch1RouteBB):
            thirdStoryLine.text = "Choice 2 then 2 selected"
        default:
            break
        }
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

