//
//  TableViewController.swift
//  ForceIt!
//
//  Created by Steve on 03/08/2016.
//  Copyright © 2016 Steve Marriott. All rights reserved.
//

import UIKit

class NoteBookViewController: UITableViewController, NoteViewDelegate {
    
    func didUpdateNoteWithTitle(newTitle: String, andBody newBody: String) {
        self.noteBookEntries[self.selectedIndex] ["title"] = newTitle
        self.noteBookEntries[self.selectedIndex] ["body"] = newBody
        
        self.tableView.reloadData()
        
        saveNotesArray()
    }
    
    var noteBookEntries = [[String:String]] ()
    
    @IBAction func newNote() {
        
        var newNote = ["title" : "", "body" : ""]
        noteBookEntries.insert(newNote, at: 0)
        self.selectedIndex = 0
        self.tableView.reloadData()
        saveNotesArray()
        performSegue(withIdentifier: "editNoteBookSegue", sender: nil)
    }
    
    @IBAction func goHome() {
        performSegue(withIdentifier: "goHome", sender: nil)
    }
    
    var selectedIndex = -1
    
    func saveNotesArray() {
        UserDefaults.standard.set(noteBookEntries, forKey: "notes")
        UserDefaults.standard.synchronize()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let newNote = UserDefaults.standard.array(forKey: "notes") as? [[String:String]] {
            noteBookEntries = newNote
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteBookEntries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell (withIdentifier: "CELL")! as UITableViewCell
        cell.textLabel?.text = noteBookEntries[indexPath.row]["title"]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            noteBookEntries.remove(at: indexPath.row)
            UserDefaults.standard.set(noteBookEntries, forKey: "notes")
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedIndex = indexPath.row
        
        performSegue(withIdentifier: "editNoteBookSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editNoteBookSegue" {
            let notesEditorVC = segue.destination as! NewNoteBookEntryViewController
                notesEditorVC.navigationItem.title = noteBookEntries[self.selectedIndex] ["title"]
                notesEditorVC.noteBodyText = noteBookEntries[self.selectedIndex] ["body"]
                notesEditorVC.delegate = self
        }
    }

}


