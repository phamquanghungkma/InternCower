//
//  ImageCell.swift
//  InternCower
//
//  Created by TofuKma on 2/1/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    static let identifer = "ImageCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
