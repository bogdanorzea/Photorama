//
//  FlickerAPI.swift
//  Photorama
//
//  Created by Bogdan Orzea on 3/11/19.
//  Copyright © 2019 Bogdan Orzea. All rights reserved.
//

import Foundation

enum FlickrError: Error {
    case invalidJSONData
}

enum Method: String {
    case interestingPhotos = "flickr.interestingness.getList"
}

struct FlickrAPI {
    private static let baseURLString = "https://api.flickr.com/services/rest/"
    private static let apiKey = "a6d819499131071f158fd740860a5a88"
    private static let dateformatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    static var interestingPhotosURL: URL {
        return flickrURL(method: .interestingPhotos, parameters: ["extras": "url_h,date_taken"])
    }
    
    private static func flickrURL(method: Method,
                                  parameters: [String: String]?) -> URL {
        var components = URLComponents(string: baseURLString)!
        var queryItems = [URLQueryItem]()
        
        let baseParams = ["method": method.rawValue,
                          "format": "json",
                          "nojsoncallback": "1",
                          "api_key": apiKey]
        for (key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additionalParams = parameters {
            for (key, val) in additionalParams {
                let item = URLQueryItem(name: key, value: val)
                queryItems.append(item)
            }
        }
        
        components.queryItems = queryItems
        
        return components.url!
    }
    
    private static func photo(fromJSON data: [String:Any]) -> Photo? {
        guard
            let photoID = data["id"] as? String,
            let title = data["title"] as? String,
            let dateString = data["datetaken"] as? String,
            let photoURLString = data["url_h"] as? String,
            let url = URL(string: photoURLString),
            let dateTaken = dateformatter.date(from: dateString)
        else {
            //Don't have enough information to construct a Photo
            return nil
        }
        
        return Photo(title: title, remoteURL: url, photoID: photoID, dateTaken: dateTaken)
        
    }
    
    static func photos(fromJSON data: Data) -> PhotoResult {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard
                let jsonDictionary = jsonObject as? [AnyHashable:Any],
                let photos = jsonDictionary["photos"] as? [String:Any],
                let photoArray = photos["photo"] as? [[String:Any]]
                else {
                    // JSON structure did not match the expectations
                    return .failure(FlickrError.invalidJSONData)
            }
            
            var finalPhotos = [Photo]()
            for photoJSON in photoArray {
                if let photo = photo(fromJSON: photoJSON) {
                    finalPhotos.append(photo)
                }
            }
            
            return .success(finalPhotos)
        } catch let error {
            return .failure(error)
        }
    }
}
