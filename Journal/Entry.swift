//
//  Entry.swift
//  Journal
//
//  Created by Sean Gilhuly on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    private let timeStampKey = "timeStamp"
    private let titleKey = "title"
    private let bodyTextKey = "bodyText"
    
    var timeStamp: NSDate
    var title: String
    var bodyText: String
    
    
    var dictionaryCopy: [String: AnyObject] {
        return [timeStampKey: timeStamp, titleKey: title, bodyTextKey: bodyText]
    }
    
    
    init(timeStamp: NSDate, title: String, bodyText: String) {
        self.timeStamp = timeStamp
        self.title = title
        self.bodyText = bodyText
    }
    
  

    
    init?(dictionary: [String: AnyObject]) {
        guard let timeStamp = dictionary[timeStampKey] as? NSDate,
        let title = dictionary[titleKey] as? String,
            let bodyText = dictionary[bodyTextKey] as? String else {
            return nil
        }
        self.timeStamp = timeStamp
        self.title = title
        self.bodyText = bodyText
        
    }
    
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return lhs.timeStamp == rhs.timeStamp && lhs.title == rhs.title && lhs.bodyText == rhs.bodyText
}