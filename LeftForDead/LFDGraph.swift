//
//  LFDGraph.swift
//  LeftForDead
//
//  Created by Charlie Morris on 07/03/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import Foundation

class Graph {
    
    var history = [NodeId]() {
        didSet {
            print("History: \(history)")
        }
    }
    
    var nodes:[NodeId: Node] {
        return _nodes
    }
    
    var _nodes = [NodeId: Node]()
    
    func addNode(node:Node) {
        node.graph = self
        _nodes[node.id] = node
    }
    
    func showNode(nodeId:NodeId) -> String {
        guard let node = nodes[nodeId] else { return "no node found"}
        history.append(nodeId)
        print(node.text)
        node.runAction()
        
        return node.text
    }
    
    func showNodes(nodeIds:[NodeId]) {
        
        history = nodeIds
        
        for (i, nodeId) in nodeIds.enumerate() {
            if let node = nodes[nodeId] {
                if i == nodeIds.count - 1 {
                    node.runAction()
                }
            }
            
        }
    }
}
