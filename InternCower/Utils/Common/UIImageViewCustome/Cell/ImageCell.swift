//
//  ImageCell.swift
//  InternCower
//
//  Created by TofuKma on 2/1/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//
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
        self.deleteButton.tintColor = .systemRed
        self.deleteButton.layer.cornerRadius = deleteButton.frame.height / 2
        self.deleteButton.isEnabled = true
        self.statusImage.isHidden = true
        self.indicatorView.isHidden = true
//        setUpCell()
//        startIndicator()
        imageView.image = UIImage(named: "ic_settings")
//        imageView.loadImage(with: "https://cowater.grooo.com.vn/upload/other/image5313.jpg")
        let url = URL(string: "https://cowater.grooo.com.vn/upload/other/image5313.jpg")!
        imageView.load(url: url)
    }
    @IBAction func didTouchDeleteBtn(_ sender: Any) {

    }
    func startIndicator() {
        self.indicatorView.isHidden = false
        self.indicatorView.startAnimating()
        self.imageView.alpha = 0.4
    }
    func stopIndicator() {
        self.indicatorView.isHidden = true
        self.indicatorView.stopAnimating()
        self.imageView.alpha = 1
    }
    func setUpAddMode() {
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .center
        imageView.image = UIImage(named: "plus")
        indicatorView.isHidden = true
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.myBoldPurple.cgColor
        imageView.alpha = 1
        deleteButton.isHidden = true
    }
    func setUpEditMode() {
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 0
        imageView.image = UIImage(named: "icon-40")
        deleteButton.isHidden = false
    }
    func setUpCell() {
        self.deleteButton.isHidden = true
    }

}

