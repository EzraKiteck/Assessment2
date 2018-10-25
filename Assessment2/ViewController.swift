//
//  ViewController.swift
//  Assessment2
//
//  Created by Ezra Kiteck on 10/25/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //UI Properties
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        //Rounds the corners of the button
        applyRoundCorner(submitButton)
        //Hides keyboard after editing
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }

    @IBAction func submitButtonTapped(_ sender: Any) {
        //If any of the fields are empty...
        guard
            let firstName = firstNameTextField.text, !firstName.isEmpty,
            let lastName = lastNameTextField.text, !lastName.isEmpty,
            let email = emailTextField.text, !email.isEmpty
            else {
                //...send an alert to the user.
                let errorAlert = UIAlertController(title: "Error", message: "Please fill all text fields", preferredStyle: UIAlertController.Style.alert)
                let dismissAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {UIAlertAction in}
                errorAlert.addAction(dismissAction)
                self.present(errorAlert, animated: true, completion: nil)
                return
        }
        //Otherwise, create a new person...
        let newPerson = Person(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, email: emailTextField.text!)
        //...and say hello!
        let greeting = UIAlertController(title: "Greetings", message: "Hello, \(newPerson.firstName) \(newPerson.lastName)! Your email address is \(newPerson.email).", preferredStyle: UIAlertController.Style.alert)
        let dismissAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {UIAlertAction in}
        greeting.addAction(dismissAction)
        self.present(greeting, animated: true, completion: nil)
    }
    
    //Smoothens the corners of any object
    func applyRoundCorner(_ object: AnyObject) {
        object.layer?.cornerRadius = object.frame.size.width / 16
        object.layer?.masksToBounds = true
    }
    
}

