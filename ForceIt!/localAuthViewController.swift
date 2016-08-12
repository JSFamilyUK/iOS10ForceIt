//
//  localAuthViewController.swift
//  ForceIt!
//
//  Created by Steve on 18/07/2016.
//  Copyright © 2016 Steve Marriott. All rights reserved.
//

import UIKit

class localAuthViewController: UIViewController {

    @IBOutlet weak var localAuthLabel: UILabel!
    
    let localAuthPhoneData = ["", "Avon Fire", "Beds Fire", "BTP", "Cambridgeshire", "Cheshire", "City of London", "Civil Nuclear", "Cleveland", "Cumbria", "Derbyshire", "Devon and Cornwall", "Dorset", "Durham", "Dyfed Powys", "Essex", "Gloucestershire", "Greater Manchester", "Gwent", "Hampshire", "Hertfordshire", "Humberside", "Kent", "Lancashire", "Leicestershire", "Lincolnshire", "Merseyside", "Metropolitan Police", "MOD", "Norfolk", "North Yorkshire", "Northamptonshire", "Northumbria", "North Wales", "Nottinghamshire", "PSNI", "Police Scotland", "South Wales", "South Yorkshire", "Staffordshire", "Suffolk", "Surrey", "Sussex", "Thames Valley", "Warwickshire", "West Mercia", "West Midlands", "West Yorkshire", "Wiltshire"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        self.localAuthLabel.text = "Info for \(forceSelectedForTabView)"
        
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

}
