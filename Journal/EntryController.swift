//
//  EntryController.swift
//  Journal
//
//  Created by Sean Gilhuly on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class EntryController {
    
    private let entryKey = "entryKey"

    static let sharedController = EntryController()
    
    var entries: [Entry]
    
    init() {
        self.entries = []
        
        loadToPersistentStore()
    }
    
   
    
    
    func addEntry(entry: Entry) {
        entries.append(entry)
        
        saveToPersistentStorage()
    }
    
    
    
    func removeEntry(entry: Entry) {
        guard let journalEntry = entries.indexOf(entry) else {
            return
        }
        entries.removeAtIndex(journalEntry)
        
        saveToPersistentStorage()
    }
    
    func saveToPersistentStorage() {
        NSUserDefaults.standardUserDefaults().setObject(entries.map({$0.dictionaryCopy}), forKey: entryKey)
    }
    
    
    func loadToPersistentStore() {
        guard let entryDictionary = NSUserDefaults.standardUserDefaults().objectForKey(entryKey) as? [[String: AnyObject]] else {
            return
        }
        entries = entryDictionary.flatMap({Entry(dictionary: $0)})
    }
    
}

