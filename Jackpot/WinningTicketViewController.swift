//
//  WinningTicketViewController.swift
//  Jackpot
//
//  Created by Doug Wagner on 3/20/18.
//  Copyright © 2018 Doug Wagner. All rights reserved.
//

import UIKit


protocol winningTicketDelegate {
    func doneButtonPressed(winningTicket ticket: Ticket)
    func userDidCancel()
}
class WinningTicketViewController: UIViewController, UITextFieldDelegate {
    var delegate: winningTicketDelegate?
    var numbersInput = Set<Int>()
    var properTicket = true  //change back to false after testing

    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var tf2: UITextField!
    @IBOutlet weak var tf3: UITextField!
    @IBOutlet weak var tf4: UITextField!
    @IBOutlet weak var tf5: UITextField!
    @IBOutlet weak var tf6: UITextField!

    @IBAction func doneButton() {
        properTicket = checkProperTicket()
        if !properTicket {
            showMyAlert()
        } else {
            if let ticket = Ticket(ticketNumbers: numbersInput) {
                delegate?.doneButtonPressed(winningTicket: ticket)
            } else {
                showMyAlert()
            }
        }
    }
    
    @IBAction func didCancel() {
        delegate?.userDidCancel()
    }
    
    func checkProperTicket() -> Bool {
        if tf1.text == "" || tf2.text == "" || tf3.text == "" ||
            tf4.text == "" || tf5.text == "" || tf6.text == "" {
            return false
        }
        
        var num: Int = Int(tf1.text!)!
        if num < 1 || num > 53 {
            return false
        }
        numbersInput.insert(num)
        num = Int(tf2.text!)!
        if num < 1 || num > 53 {
            return false
        }
        numbersInput.insert(num)
        num = Int(tf3.text!)!
        if num < 1 || num > 53 {
            return false
        }
        numbersInput.insert(num)
        num = Int(tf4.text!)!
        if num < 1 || num > 53 {
            return false
        }
        numbersInput.insert(num)
        num = Int(tf5.text!)!
        if num < 1 || num > 53 {
            return false
        }
        numbersInput.insert(num)
        num = Int(tf6.text!)!
        if num < 1 || num > 53 {
            return false
        }
        numbersInput.insert(num)
        
        return true
    }
    
    func showMyAlert() {
        let alert = UIAlertController(title: "Woah now!",
                                      message: "Please make sure all numbers are between 1-53 and there are no duplicates",
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok",
                                   style: .default,
                                   handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    
    // MARK:-
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numbersInput = Set<Int>()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
