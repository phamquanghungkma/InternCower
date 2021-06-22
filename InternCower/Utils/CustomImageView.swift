//
//  CustomImageView.swift
//  InternCower
//
//  Created by Apple on 2/5/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import UIKit
var imageCache = [String: UIImage]()
class CustomImageView: UIImageView {

    var lastImgUrlUsedToLoadImage: String?

    func loadImageData(with urlString: String){

        self.image = nil // UIImageView.image = nil
 
        lastImgUrlUsedToLoadImage = urlString // đường link ảnh lấy đc từ DB
        
        // check if image exist in cache ( check urlString if exist in Dictionary)
           if let cachedImage = imageCache[urlString]{
                    self.image = cachedImage
                    return // thoat luon khoi cai ham nay
                }
               guard let url = URL(string: urlString) else {return}
               URLSession.shared.dataTask(with: url) { (data,respone,error) in
                   if let error = error { print("failed to load Image with error : \(error.localizedDescription)")}
                if self.lastImgUrlUsedToLoadImage != url.absoluteString {
                    print("If Blocked excuted")
                    return
                }
                    guard let imageData = data else { return }
                    // set image using imageData
                    let photoImage = UIImage(data: imageData)
                    // set key and value for image cache
                    imageCache[url.absoluteString] = photoImage
                    // set image
                    DispatchQueue.main.async{ self.image = photoImage}
                }.resume()
    }
    
}
