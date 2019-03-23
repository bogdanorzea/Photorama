//
//  TagDataSource.swift
//  Photorama
//
//  Created by Bogdan Orzea on 3/22/19.
//  Copyright © 2019 Bogdan Orzea. All rights reserved.
//

import CoreData
import UIKit

class TagDataSource: NSObject, UITableViewDataSource {
    var tags = [Tag]()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let tag = tags[indexPath.row]
        cell.textLabel?.text = tag.name
        
        return cell
    }
    
}
