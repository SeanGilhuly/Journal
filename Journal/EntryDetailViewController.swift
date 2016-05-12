//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Sean Gilhuly on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    
    @IBOutlet weak var enterTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    

    @IBAction func saveButton(sender: AnyObject) {
        
        
        
    }
    
    
    
    
    @IBAction func clearButton(sender: AnyObject) {
        
        enterTextField.text = ""
        textView.text = ""
        
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        enterTextField.resignFirstResponder()
        
        return true
    }

}
