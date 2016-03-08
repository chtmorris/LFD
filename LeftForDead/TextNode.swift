//
//  TextNode.swift
//  LeftForDead
//
//  Created by Leo Tumwattana on 8/3/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

final class TextNode:Node {
    
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