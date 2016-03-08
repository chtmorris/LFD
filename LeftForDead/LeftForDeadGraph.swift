//
//  LeftForDeadGraph.swift
//  LeftForDead
//
//  Created by Charlie Morris on 07/03/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import Foundation

final class LeftForDeadGraph: Graph {
    
    override func initialNodeId() -> String {
        return "1.001"
    }
    
    override init(presenter: GraphPresenter) {
        super.init(presenter: presenter)
        
        addNode(TextNode(id: "1.001", text: "You are at the bottom of an ocean of darkness.",
            action: DelayAction(delayInSeconds: 3, nextNodeId: "1.002")))
        
        addNode(TextNode(id: "1.002", text: "Down here in the dark, you see the flashes again. You can smell the smoke.",
            action: DelayAction(delayInSeconds: 4, nextNodeId: "1.003")))
        
        addNode(TextNode(id: "1.003", text: "You can hear the screams.",
            action: DelayAction(delayInSeconds: 3, nextNodeId: "1.2")))

        addNode(TextNode(id: "1.2", text: "Perhaps, though, you ought to head back to the village.",
            action: DisplayChoicesAction(choices: [
                ChoiceAction(text: "Head for the riverOO", nextNodeId: "2.0"),
                ChoiceAction(text: "Go back to the village", nextNodeId: "3.0")
            ])))

        addNode(TextNode(id: "2.0", text: "Great. Let head to the river",
            action: DelayAction(delayInSeconds: 1, nextNodeId: "1.001")))
        
        addNode(TextNode(id: "3.0", text: "Fine. Let's go to the village then",
            action: DelayAction(delayInSeconds: 1, nextNodeId: "1.002")))

    }
    
//    init(viewController vc:GraphViewController) {
//        self.init(viewController: vc)
//    }
//    
//    
//    override init() {
//        super.init()
//        addNode(Node(id: "1.001", text: "You are at the bottom of an ocean of darkness.", action: DelayAction(delayInSeconds: 3, nextNodeId: "1.002")))
//        addNode(Node(id: "1.002", text: "Down here in the dark, you see the flashes again. You can smell the smoke.", action: DelayAction(delayInSeconds: 4, nextNodeId: "1.003")))
//        addNode(Node(id: "1.003", text: "You can hear the screams.", action: DelayAction(delayInSeconds: 3, nextNodeId: "1.2")))
//        
//        addNode(Node(id: "1.2", text: "Perhaps, though, you ought to head back to the village.", action: DisplayChoicesAction(choices: [
//            ChoiceAction(text: "Head for the river", nextNodeId: "2.0"),
//            ChoiceAction(text: "Go back to the village", nextNodeId: "3.0")
//            ])))
//        
//        addNode(Node(id: "2.0", text: "Great. Let head to the river", action: DelayAction(delayInSeconds: 1, nextNodeId: "1.001")))
//        addNode(Node(id: "3.0", text: "Fine. Let's go to the village then", action: DelayAction(delayInSeconds: 1, nextNodeId: "1.002")))
//    }
    
}