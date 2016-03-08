//
//  LFDChoiceCell.swift
//  LeftForDead
//
//  Created by Charlie Morris on 08/03/2016.
//  Copyright © 2016 Mind Fund Studio. All rights reserved.
//

import UIKit

final class LFDChoicesCell: UICollectionViewCell {
    
    var choices = [ChoiceAction]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    @IBOutlet weak var collectionView:UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
}
