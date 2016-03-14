//
//  LFDStoryTextCell.swift
//  LeftForDead
//
//  Created by Charlie Morris on 23/02/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import UIKit

final class LFDNodeCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    func configure(text: String) {
        label.text = text
    }
}
