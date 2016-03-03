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
    let specialAttribute:String
    
    init(text:String, delayInSeconds delay:CFTimeInterval, specialAttribute:String) {
        self.text = text
        self.delay = delay
        self.specialAttribute = specialAttribute
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