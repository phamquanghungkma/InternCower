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
    var imageUrlList: [String]?{
        didSet {
            print("Gan documents",imageUrlList)
        }
    }
    var dataDetail: DataDetail? {
        didSet {
            let captions = dataDetail?.caption ?? ""
            self.captionTextView.text = captions
        }
    }

    func setUpCollectionView() {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.itemSize = CGSize(width: 80, height: 80)
        collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.minimumLineSpacing = 0
        collectionViewFlowLayout.minimumInteritemSpacing = 0

        imageCollectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        //add delegate
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.register(
            UINib(nibName: ImageCell.identifer, bundle: nil), forCellWithReuseIdentifier: ImageCell.identifer)
        imageCollectionView.reloadData()
    }
}

extension ImageCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifer, for: indexPath)
        guard let imageCell = cell as? ImageCell else {
            return cell
        }
        imageCell.setUpCell()
        for item in imageUrlList ?? [""] {
             print("imageLink",item)
        }
       
//        imageCell.imageView.image = UIImage()
//        imageCell.startIndicator()
        return imageCell
    }
}
