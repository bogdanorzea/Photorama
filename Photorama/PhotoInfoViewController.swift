//
//  PhotoInfoViewController.swift
//  Photorama
//
//  Created by Bogdan Orzea on 3/16/19.
//  Copyright © 2019 Bogdan Orzea. All rights reserved.
//

import UIKit

class PhotoInfoViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var photo: Photo! {
        didSet {
            navigationItem.title = photo.title
        }
    }
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchImage(for: photo, completion: {(result) -> Void in
            switch result {
            case let .success(image):
                self.imageView.image = image
            case let .failure(error):
                print("Error fetching the image for photo: \(error)")
            }
        })
    }
}
