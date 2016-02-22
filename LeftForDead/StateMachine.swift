//
//  StateMachine.swift
//  LeftForDead
//
//  Created by Charlie Morris on 22/02/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import Foundation

protocol StateMachineDelegateProtocol: class {
    typealias StateType
    func shouldTransitionFrom(from:StateType, to:StateType) -> Bool
    func didTransitionFrom(from:StateType, to:StateType)
}

class StateMachine<P:StateMachineDelegateProtocol>{
    private unowned let delegate:P
    private var _state:P.StateType{
        didSet{ delegate.didTransitionFrom(oldValue, to:_state) }
    }
    var state:P.StateType{
        get{ return _state }
        set{
            if delegate.shouldTransitionFrom(_state, to:newValue){
                _state = newValue
            }
        }
    }
    
    init(initialState:P.StateType, delegate:P){
        _state = initialState
        self.delegate = delegate
    }
}