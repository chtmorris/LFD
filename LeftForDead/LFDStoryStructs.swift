//
//  LFDStoryStructs.swift
//  LeftForDead
//
//  Created by Charlie Morris on 03/03/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import Foundation

struct Sentence {
    let text:String
    let delay:CFTimeInterval
    let specialAttribute:String?
    let decisionAText:String?
    let decisionBText:String?
    let decisionARoute:Story?
    let decisionBRoute:Story?
    
    init(text:String, delayInSeconds delay:CFTimeInterval, specialAttribute:String, decisionAText:String, decisionBText:String, decisionARoute:Story, decisionBRoute:Story) {
        self.text = text
        self.delay = delay
        self.specialAttribute = specialAttribute
        self.decisionAText = decisionAText
        self.decisionBText = decisionBText
        self.decisionARoute = decisionARoute
        self.decisionBRoute = decisionBRoute
    }
    
    init(text:String, delayInSeconds delay:CFTimeInterval, specialAttribute:String) {
        self.text = text
        self.delay = delay
        self.specialAttribute = specialAttribute
        self.decisionAText = nil
        self.decisionBText = nil
        self.decisionARoute = nil
        self.decisionBRoute = nil
    }
    
    init(text:String, delayInSeconds delay:CFTimeInterval) {
        self.text = text
        self.delay = delay
        self.specialAttribute = nil
        self.decisionAText = nil
        self.decisionBText = nil
        self.decisionARoute = nil
        self.decisionBRoute = nil
    }

}

struct Paragraph {
    private var sentences:[Sentence]
    
    init(sentences:[Sentence]) {
        self.sentences = sentences
    }
    
    mutating func nextSentence() -> Sentence? {
        if sentences.count > 0 {
            return sentences.removeFirst()
        }
        return nil
    }
}

struct DecisionButton {
    let text:String
    let storyRoute:Story
    
    init(text:String, storyRoute:Story) {
        self.text = text
        self.storyRoute = storyRoute
    }
}