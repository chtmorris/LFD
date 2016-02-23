//
//  StateMachine.swift
//  LeftForDead
//
//  Created by Charlie Morris on 22/02/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import Foundation

class StateMachine<P:StateMachineDelegateProtocol>{
    
    private unowned let delegate:P
    private let validTransitions: [P.StateType: [P.StateType]]
    
    private var _state:P.StateType{
        didSet{
            delegate.didTransitionFrom(oldValue, to:_state)
        }
    }
    
    var state:P.StateType{
        get{
            return _state
        }
        set{ //Can't be an observer because we need the option to CONDITIONALLY set state
            attemptTransitionTo(newValue)
        }
    }
    
    
    init(initialState:P.StateType, delegate:P, validTransitions: [P.StateType: [P.StateType]]){
        _state = initialState //set the primitive to avoid calling the delegate.
        self.validTransitions = validTransitions
        self.delegate = delegate
    }
    
    
    private func attemptTransitionTo(to:P.StateType){
        if let validNexts = validTransitions[_state] {
            if validNexts.contains(to) {
                _state = to
            } else {
                // error, etc
            }
        }
    }
}

protocol StateMachineDelegateProtocol: class {
    // make this be hashable so we can pass in a dictionary
    typealias StateType : Hashable
    
    func didTransitionFrom(from:StateType, to:StateType)
}