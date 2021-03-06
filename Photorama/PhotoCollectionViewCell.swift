//
//  PhotoCollectionViewCell.swift
//  Photorama
//
//  Created by Bogdan Orzea on 3/14/19.
//  Copyright © 2019 Bogdan Orzea. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    var photoDescription: String?
    
    // MARK: - Accesibility labels
    override var isAccessibilityElement: Bool {
        get {
            return true
        }
        set {
            super.isAccessibilityElement = newValue
        }
    }
    override var accessibilityLabel: String? {
        get {
            return photoDescription
        }
        set {
            
        }
    }
    override var accessibilityTraits: UIAccessibilityTraits {
        get {
            return UIAccessibilityTraits.image
        }
        set {
            
        }
    }
    func update(with image: UIImage?) {
        if let imageToDisplay = image {
            spinner.stopAnimating()
            imageView.image = imageToDisplay
        } else {
            spinner.startAnimating()
            imageView.image = nil
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.update(with: nil)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.update(with: nil)
    }
}
