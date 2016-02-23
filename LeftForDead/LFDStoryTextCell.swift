//
//  LFDStoryTextCell.swift
//  LeftForDead
//
//  Created by Charlie Morris on 23/02/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import UIKit

class LFDStoryTextCell: UICollectionViewCell {
    
    @IBOutlet weak var storyTextLabel: UILabel!
    
    func configure(storyText: String) {
        storyTextLabel.text = storyText
    }
}
