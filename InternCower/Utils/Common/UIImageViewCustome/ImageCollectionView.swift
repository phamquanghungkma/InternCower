//
//  ImageCollectionView.swift
//  InternCower
//
//  Created by Apple on 1/28/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import UIKit

class ImageCollectionView: UIView {
    
    
    static let identifier = "ImageCollectionView"
    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var captionTextView: UITextView!
    override class func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    

    
}

extension ImageCollectionView: UICollectionViewDelegate {
    
}

