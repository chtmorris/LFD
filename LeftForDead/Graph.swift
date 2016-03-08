//
//  Graph.swift
//  LeftForDead
//
//  Created by Charlie Morris on 07/03/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

class Graph {
    
    final var presenter:GraphPresenter?
    
    final var path:[Node] {
        return _path
    }
    
    private var _path = [Node]()
    
    final var nodes:[NodeId: Node] {
        return _nodes
    }
    
    private var _nodes = [NodeId: Node]()
    
    init(presenter:GraphPresenter) {
        self.presenter = presenter
    }
    
    func initialNodeId() -> String {
        return "1.0"
    }
    
    final func addNode(var node:Node) {
        node.graph = self
        _nodes[node.id] = node
    }
    
    final func showNode(nodeId:NodeId) {
        if let presenter = presenter, node = nodes[nodeId] {
            _path.append(node)
            presenter.displayNode(node)
        }
    }
    
    final func showInitialNode() {
        if let presenter = presenter, node = nodes[initialNodeId()] {
            _path.append(node)
            presenter.displayNode(node)
        }
    }
}
