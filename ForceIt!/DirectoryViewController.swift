//
//  DirectoryViewController.swift
//  ForceIt!
//
//  Created by Steve on 16/07/2016.
//  Copyright © 2016 Steve Marriott. All rights reserved.
//

import UIKit

var forceSelectedForTabView = String()
var forceSelectedPositionInArray = Int()


class DirectoryViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    

    @IBOutlet weak var forcePicker: UIPickerView!
    @IBOutlet weak var selectedIssiLabel: UILabel!
    @IBOutlet weak var selectedPhoneTextView: UITextView!
    @IBOutlet weak var selectedWebsiteTextView: UITextView!

    
    
    // Array containing the list of available forces
    let forcePickerData = ["", "Avon and Somerset", "Bedfordshire", "BTP", "Cambridgeshire", "Cheshire", "City of London", "Civil Nuclear", "Cleveland", "Cumbria", "Derbyshire", "Devon and Cornwall", "Dorset", "Durham", "Dyfed Powys", "Essex", "Gloucestershire", "Greater Manchester", "Gwent", "Hampshire", "Hertfordshire", "Humberside", "Kent", "Lancashire", "Leicestershire", "Lincolnshire", "Merseyside", "Metropolitan Police", "MOD", "Norfolk", "North Yorkshire", "Northamptonshire", "Northumbria", "North Wales", "Nottinghamshire", "PSNI", "Police Scotland", "South Wales", "South Yorkshire", "Staffordshire", "Suffolk", "Surrey", "Sussex", "Thames Valley", "Warwickshire", "West Mercia", "West Midlands", "West Yorkshire", "Wiltshire"]
    
    // Array containing the ISSI prefixes for each force
    let issiData = ["", "001", "002", "003", "004", "005", "006", "Civil Nuclear", "Cleveland", "Cumbria", "Derbyshire", "Devon and Cornwall", "Dorset", "Durham", "Dyfed Powys", "Essex", "Gloucestershire", "Greater Manchester", "Gwent", "Hampshire", "Hertfordshire", "Humberside", "Kent", "Lancashire", "Leicestershire", "Lincolnshire", "Merseyside", "Metropolitan Police", "MOD", "Norfolk", "North Yorkshire", "Northamptonshire", "Northumbria", "North Wales", "Nottinghamshire", "PSNI", "Police Scotland", "South Wales", "South Yorkshire", "Staffordshire", "Suffolk", "Surrey", "Sussex", "Thames Valley", "Warwickshire", "West Mercia", "West Midlands", "West Yorkshire", "Wiltshire"]
    
    // Array containing the geographic numbers for each force
    let phoneData = ["", "01275 818340", "01234 841212", "0800 405040", "01480 456111", "01244 350000", "020 7601 2222", "01946 773999", "01642 326326", "0300 1240111", "0345 1233333", "01392 420320", "01202 222222", "0345 6060365", "01267 222020", "01245 491491", "01452 726920", "0161 872 5050", "01633 838111", "01962 841534", "01707 354000", "01482 597600", "01622 690690", "01772 614444", "0116 222 2222", "01522 532222", "0151 709 6010", "020 7230 1212", "No National Number", "01953 424242", "01904 618691", "03000 111 222", "01661 872555", "0300 330 0101", "0115 967 0999", "028 9065 0222", "01786 289070", "01656 655555", "0114 2196905", "0300 123 4455", "01473 613500", "01483 571212", "01273 475432", "01865 841148", "01926 415000", "0300 333 3000", "0345 113 5000", "01924 375 222", "01380 826 614"]
    
    // Array containing the geographic numbers for each force
    let websiteData = ["", "http://www.avonandsomerset.police.uk/", "http://www.bedfordshire.police.uk/", "http://www.btp.police.uk/", "http://www.cambs.police.uk/", "https://www.cheshire.police.uk", "http://www.cityoflondon.police.uk", "https://www.gov.uk/government/organisations/civil-nuclear-constabulary", "https://www.cleveland.police.uk", "http://www.cumbria.police.uk", "http://www.derbyshire.police.uk", "http://www.devon-cornwall.police.uk", "http://www.dorset.police.uk", "http://www.durham.police.uk", "http://www.dyfed-powys.police.uk", "http://www.essex.police.uk", "https://www.gloucestershire.police.uk/", "http://www.gmp.police.uk", "http://www.gwent.police.uk", "http://www.hampshire.police.uk", "http://www.herts.police.uk", "http://www.humberside.police.uk", "http://www.kent.police.uk", "http://www.lancashire.police.uk", "http://www.leics.police.uk", "https://www.lincs.police.uk", "http://www.merseyside.police.uk", "http://www.met.police.uk", "http://www.mod.police.uk/", "http://www.norfolk.police.uk", "http://www.northyorkshire.police.uk", "http://www.northants.police.uk", "http://www.northumbria.police.uk", "http://www.north-wales.police.uk", "http://www.nottinghamshire.police.uk", "http://www.psni.police.uk", "http://www.scotland.police.uk/", "http://www.south-wales.police.uk", "http://www.southyorks.police.uk", "http://www.staffordshire.police.uk", "http://www.suffolk.police.uk", "http://www.surrey.police.uk", "http://www.sussex.police.uk", "http://www.thamesvalley.police.uk", "http://www.warwickshire.police.uk", "http://westmercia.police.uk", "http://www.west-midlands.police.uk", "http://www.westyorkshire.police.uk", "http://www.wiltshire.police.uk"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        forcePicker.dataSource = self
        forcePicker.delegate = self
            
        }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
}

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return forcePickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return forcePickerData[row]
    }

        //function allowing the font and colour of the picker to be changed
        func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
            let titleData = forcePickerData[row]
            let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Verdana", size: 25.0)!,NSForegroundColorAttributeName:UIColor.black])
            return myTitle
        }
        
        //function returning the selected row from the picker
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            
            forceSelectedForTabView = String(forcePickerData[row])
            forceSelectedPositionInArray = forcePickerData.index(of: forcePickerData[row])!
            
            
            self.selectedIssiLabel.text = issiData[Int(forcePickerData.index(of: forcePickerData[row])!)]
            
            
            self.selectedPhoneTextView.text = phoneData[Int(forcePickerData.index(of: forcePickerData[row])!)]
            
            
            self.selectedWebsiteTextView.text = websiteData[Int(forcePickerData.index(of: forcePickerData[row])!)]
    }
}
