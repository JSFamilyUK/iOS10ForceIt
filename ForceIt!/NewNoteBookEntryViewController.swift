//
//  NewNoteBookEntryViewController.swift
//  ForceIt!
//
//  Created by Steve on 03/08/2016.
//  Copyright © 2016 Steve Marriott. All rights reserved.
//

import UIKit

protocol NoteViewDelegate {
    
    func didUpdateNoteWithTitle(newTitle : String, andBody newBody : String)
}

class NewNoteBookEntryViewController: UIViewController, UITextViewDelegate {
    
    var delegate : NoteViewDelegate?
  
    @IBOutlet weak var noteBody: UITextView!
    @IBOutlet weak var doneEditing: UIBarButtonItem!
    @IBAction func doneEditingBody() {
        
        self.noteBody.resignFirstResponder()
        self.doneEditing.tintColor = UIColor.clear
        if self.delegate != nil {
            self.delegate!.didUpdateNoteWithTitle(newTitle: self.navigationItem.title!, andBody: self.noteBody.text)
        }
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        self.doneEditing.tintColor = UIColor (red: 0, green: 122.0/255.0, blue: 1, alpha: 1)
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let components = self.noteBody.text.components(separatedBy: "\n")
        self.navigationItem.title = ""
        for item in components {
                self.navigationItem.title = item
                break
            }
    }
    
    var noteBodyText : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.noteBody.text = self.noteBodyText
        self.noteBody.becomeFirstResponder()
        
        self.noteBody.delegate = self

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.delegate != nil {
            self.delegate!.didUpdateNoteWithTitle(newTitle: self.navigationItem.title!, andBody: self.noteBody.text)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
