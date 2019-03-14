//
//  Photo.swift
//  Photorama
//
//  Created by Bogdan Orzea on 3/13/19.
//  Copyright © 2019 Bogdan Orzea. All rights reserved.
//

import Foundation

class Photo {
    let title: String
    let remoteURL: URL
    let photoID: String
    let dateTaken: Date
    
    init(title: String, remoteURL: URL, photoID: String, dateTaken: Date) {
        self.title = title
        self.remoteURL = remoteURL
        self.photoID = photoID
        self.dateTaken = dateTaken
    }
}
