//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Sean Gilhuly on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var enterTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // We are creating a smiliar instance to the one above but have to because we are calling it inside its own function
        // if our new function equals the instance above, then we need to load it
        // update all view elements
        
        if let entry = entry {
            updateWithEntry(entry)
        }

    }
    
    @IBAction func saveButton(sender: AnyObject) {
        guard let entry = entry else {
            let newEntry = Entry(timeStamp: NSDate(), title: enterTextField.text ?? "", bodyText: textView.text ?? "")
            EntryController.sharedController.addEntry(newEntry)
            self.navigationController?.popToRootViewControllerAnimated(true)
            return
        }
        entry.title = enterTextField.text ?? ""
        entry.bodyText = textView.text ?? ""
        
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        }
        
        
    
    @IBAction func clearButton(sender: AnyObject) {
        
        enterTextField.text = ""
        textView.text = ""
        
    }
    
    func updateWithEntry(entry: Entry) {
        self.entry = entry
        
        self.enterTextField.text = entry.title
        self.textView.text = entry.bodyText
    }
    
    // MARK: UITextFieldDelegate

    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }

}
