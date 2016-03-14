//
//  ChoicesNode.swift
//  LeftForDead
//
//  Created by Leo Tumwattana on 8/3/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

final class ChoicesNode:Node {
    
    weak var graph:Graph?
    
    let id:NodeId
    let choices:[ChoiceAction]
    let action:Action
    
    init(id:NodeId, choices:[ChoiceAction], var action:Action) {
        self.id = id
        self.choices = choices
        self.action = action
        action.node = self
    }
    
    func runAction() {
        action.run()
    }
}
