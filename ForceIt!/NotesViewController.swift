//
//  NotesViewController.swift
//  ForceIt!
//
//  Created by Steve on 15/07/2016.
//  Copyright © 2016 Steve Marriott. All rights reserved.
//

import UIKit

var tableOfNotes = [String]()

class NotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var notesTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if UserDefaults.standard.object(forKey: "forceItNotes") != nil {
        
            tableOfNotes = UserDefaults.standard.object(forKey: "forceItNotes") as! [String]
    
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // count the rows int the global array var tableOfNotes
        return tableOfNotes.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        // add the values of the array to the table
        cell.textLabel?.text = tableOfNotes[indexPath.row]
        
        return cell
        
    }
    
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            tableOfNotes.remove(at: indexPath.row)
            
            UserDefaults.standard.set(tableOfNotes, forKey: "forceItNotes")
            
            notesTable.reloadData()
            
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        notesTable.reloadData()
        
    }
    
}
