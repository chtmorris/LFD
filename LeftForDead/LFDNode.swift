//
//  StateMachine.swift
//  LeftForDead
//
//  Created by Charlie Morris on 22/02/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import Foundation

typealias NodeId = String

class Node {
    
    weak var graph:Graph?
    
    let id:NodeId
    let text:String
    let action:Action
    
    init(id:NodeId, text:String, var action:Action) {
        self.id = id
        self.text = text
        self.action = action
        action.node = self
    }
    
    func runAction() {
        action.run()
    }
}
