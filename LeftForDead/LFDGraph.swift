//
//  LFDGraph.swift
//  LeftForDead
//
//  Created by Charlie Morris on 07/03/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import Foundation

class Graph {
    
    var viewController:GraphViewController?
    
    var pathCount:Int {
        return path.count
    }
    
    var path:[Node] {
        return _path
    }
    
    private var _path = [Node]()
    
    var nodes:[NodeId: Node] {
        return _nodes
    }
    
    private var _nodes = [NodeId: Node]()
    
    init(viewController:GraphViewController) {
        self.viewController = viewController
    }
    
    func addNode(node:Node) {
        node.graph = self
        _nodes[node.id] = node
    }
    
    func moveToNode(nodeId:NodeId) -> Node? {
        if let node = nodes[nodeId] {
            _path.append(node)
            return node
        }
        return nil
    }
}
