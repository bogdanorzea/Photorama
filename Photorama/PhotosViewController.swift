//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Bogdan Orzea on 3/11/19.
//  Copyright © 2019 Bogdan Orzea. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchInterestingPhotos()
    }
}
