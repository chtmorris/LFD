//
//  LFDMyStory.swift
//  LeftForDead
//
//  Created by Charlie Morris on 23/02/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import Foundation

class MyStory {
    var storyText:String?
    var chapter:Int?
    
    init(storyText: String, chapter: Int) {
        self.storyText = storyText
        self.chapter = chapter
    }
}