//
//  JackpotTableViewController.swift
//  Jackpot
//
//  Created by Doug Wagner on 3/19/18.
//  Copyright © 2018 Doug Wagner. All rights reserved.
//

import UIKit

class JackpotTableViewController: UITableViewController, winningTicketDelegate {
    
    var _tickets = [Ticket]()
    var _winningTicket: Ticket?
    
    
    // MARK: - Action Handlers
    @IBAction func addTicket() {
        _tickets.append(Ticket())
        tableView.reloadData()
    }
    
    
    // MARK:- Delegate Methods
    func doneButtonPressed(winningTicket ticket: Ticket) {
        _winningTicket = ticket
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
    func userDidCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK:-
    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "My Tickets"
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! WinningTicketViewController
        controller.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return _tickets.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TicketCell", for: indexPath)
            let ticket = _tickets[indexPath.row]
            if let winTicket = _winningTicket {
                winTicket.compareForWinnings(ticket: ticket)
            }
            configureLabelText(forThis: cell, withNumbersFrom: ticket)
            
            //I need to move this to the ticket class
            if ticket.isWinner {
                let label = cell.viewWithTag(1002) as! UILabel
                label.text = "$\(ticket.winnings!)"
            } else {
                let label = cell.viewWithTag(1002) as! UILabel
                label.text = ""
            }
            cell.backgroundColor = ticket.myColor
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WinningTicketCell", for: indexPath)
        if let winTicket = _winningTicket {
            configureLabelText(forThis: cell, withNumbersFrom: winTicket, frontText: "The winning ticket: ")
            return cell
        } else {
            let label = cell.viewWithTag(1001) as! UILabel
            label.text = "Enter winning ticket numbers!"
            return cell
        }
    }
    
    // MARK:-
    func configureLabelText(forThis cell: UITableViewCell, withNumbersFrom ticket: Ticket, frontText: String = "") {
        let label = cell.viewWithTag(1001) as! UILabel
        label.text = frontText + ticket.description
    }
}
