//
//  LoginViewController.swift
//  Instagram
//
//  Created by Gina Ratto on 2/23/17.
//  Copyright © 2017 Gina Ratto. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignin(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) {
                (user: PFUser?, error: Error?) -> Void in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        newUser.username = usernameField.text
        newUser.password = passwordField.text

        newUser.signUpInBackground { (success: Bool, error: Error?) -> Void in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else {
                print(error?.localizedDescription)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
