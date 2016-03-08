//
//  Actions.swift
//  LeftForDead
//
//  Created by Charlie Morris on 07/03/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import Foundation 

protocol Action {
    var node:Node? { get set }
    func run()
}

final class DelayAction:Action {
    
    let delayInSeconds:CFTimeInterval
    let nextNodeId:String
    var node:Node?
    
    init(delayInSeconds delay:CFTimeInterval, nextNodeId id:NodeId) {
        delayInSeconds = delay
        nextNodeId = id
    }
    
    func run() {
        Helper.delay(delayInSeconds) {
            print(self.node)
            self.node?.graph?.showNode(self.nextNodeId)
        }
    }
}

final class ChoiceAction:Action {
    
    var node:Node?
    let nextNodeId:NodeId
    let text:String
    
    init(text:String, nextNodeId:String) {
        self.nextNodeId = nextNodeId
        self.text = text
    }
    
    func run() {
        self.node?.graph?.showNode(self.nextNodeId)
    }
}

final class DisplayChoicesAction:Action {
    
    var node:Node?
    let choices:[ChoiceAction]
    
    init(choices:[ChoiceAction]) {
        self.choices = choices
    }
    
    func run() {
        self.node?.graph?.presenter?.showChoices(choices)
    }
    
}
