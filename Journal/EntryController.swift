//
//  EntryController.swift
//  Journal
//
//  Created by Sean Gilhuly on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class EntryController {

    static let sharedInstance = EntryController()
    
    var entries = [Entry]()
    
//    init() {
//        self.entries = []
//    }
    
    
    func addEntry(entry: Entry) {
        entries.append(entry)
    }
    
    func removeEntry(entry: Entry) {
        guard let indexOfEntry = entries.indexOf(entry) else {
            return
        }
        entries.removeAtIndex(indexOfEntry)
    }
}

