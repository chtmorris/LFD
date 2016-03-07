//
//  LFDActions.swift
//  LeftForDead
//
//  Created by Charlie Morris on 07/03/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import Foundation

protocol Action {
    func runOnGraph(graph:Graph)
}


struct DelayAction:Action {
    
    let delayInSeconds:CFTimeInterval
    let nextNodeId:String
    
    init(delayInSeconds delay:CFTimeInterval, nextNodeId id:NodeId) {
        delayInSeconds = delay
        nextNodeId = id
    }
    
    func runOnGraph(graph:Graph) {
        Helper.delay(delayInSeconds, closure: {
            graph.showNode(self.nextNodeId)
        })
    }
}


struct ChoiceAction:Action {
    
    let nextNodeId:NodeId
    let text:String
    
    init(text:String, nextNodeId:String) {
        self.nextNodeId = nextNodeId
        self.text = text
    }
    
    func runOnGraph(graph: Graph) {
        graph.showNode(self.nextNodeId)
    }
}


struct DisplayChoicesAction:Action {
    
    func showChoices(choices:[ChoiceAction]) {
        print("==========")
        for (i, choice) in choices.enumerate() {
            print("\(i): \(choice.text)")
        }
        print("==========")
    }
    
    let choices:[ChoiceAction]
    
    init(choices:[ChoiceAction]) {
        self.choices = choices
    }
    
    func runOnGraph(graph: Graph) {
        showChoices(choices)
        
        Helper.delay(3, closure: {
            // Simulate user input
            print("> User Chooses: 1")
            self.choices.last?.runOnGraph(graph)
        })
    }
}
