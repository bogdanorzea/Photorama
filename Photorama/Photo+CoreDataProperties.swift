//
//  Photo+CoreDataProperties.swift
//  Photorama
//
//  Created by Bogdan Orzea on 3/18/19.
//  Copyright © 2019 Bogdan Orzea. All rights reserved.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var photoID: String?
    @NSManaged public var title: String?
    @NSManaged public var dateTaken: NSDate?
    @NSManaged public var remoteURL: NSURL?

}
