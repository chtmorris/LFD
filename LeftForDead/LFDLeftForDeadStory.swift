//
//  LFDLeftForDeadStory.swift
//  LeftForDead
//
//  Created by Charlie Morris on 07/03/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import Foundation

class LeftForDeadStory: Graph {
    
    override init() {
        super.init()
        addNode(Node(id: "1.0", text: "Hello, my name is Leo", action: DelayAction(delayInSeconds: 1, nextNodeId: "1.1")))
        addNode(Node(id: "1.1", text: "We will be doing some programming today.", action: DelayAction(delayInSeconds: 1, nextNodeId: "1.2")))
        
        addNode(Node(id: "1.2", text: "Shall we get started?", action: DisplayChoicesAction(choices: [
            ChoiceAction(text: "Okay, lets start programming", nextNodeId: "2.0"),
            ChoiceAction(text: "No thanks", nextNodeId: "3.0")
            ])))
        
        addNode(Node(id: "2.0", text: "Great. Let start with LFD", action: DelayAction(delayInSeconds: 1, nextNodeId: "1.1")))
        addNode(Node(id: "3.0", text: "Fine. Let's restart the day", action: DelayAction(delayInSeconds: 1, nextNodeId: "1.0")))
    }
    
}