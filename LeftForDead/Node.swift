//
//  Node.swift
//  LeftForDead
//
//  Created by Charlie Morris on 22/02/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

typealias NodeId = String

protocol Node {
    var graph:Graph? { get set }
    var id:String { get }
    func runAction()
}


