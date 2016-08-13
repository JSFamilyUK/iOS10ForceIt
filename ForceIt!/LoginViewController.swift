//
//  LoginViewController.swift
//  ForceIt!
//
//  Created by Steve on 13/08/2016.
//  Copyright © 2016 Steve Marriott. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {


    @IBAction func createAccountButton(_ sender: AnyObject) {
    }
   
    @IBAction func loginButton(_ sender: AnyObject) {
    }
    @IBAction func skipLoginButton(_ sender: AnyObject) {
        performSegue(withIdentifier: "loginSuccess", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testObject = PFObject(className: "TestObject2")
        testObject["foo"] = "bar"
        testObject.saveInBackground { (success, error) -> Void in
            // added test for success 11th July 2016
            if success {
                print("Object has been saved.")
            } else {
                if error != nil {
                    print (error)
                } else {
                    print ("Error")
                }
            }
        }

        // Do any additional setup after loading the view.
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
