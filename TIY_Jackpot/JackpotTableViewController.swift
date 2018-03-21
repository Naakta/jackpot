//
//  JackpotTableViewController.swift
//  TIY_Jackpot
//
//  Created by Doug Wagner on 3/19/18.
//  Copyright © 2018 Doug Wagner. All rights reserved.
//

import UIKit

class JackpotTableViewController: UITableViewController {
    var _tickets = [Ticket]()
    var _winningTicket = Ticket()
    
    @IBAction func addTicket() {
        _tickets.append(Ticket())
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        title = "My Tickets"
        super.viewDidLoad()
        
        // Debugging/Teting
        for _ in 0...15 {
            _tickets.append(Ticket())
        }
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
    
    // MARK:- TODO
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // needs to compare ticket to winning ticket and gather the correct info
        // winning ticket will need to be optional once i design the user input of winning ticket numbers
        // compare will set the different information that VC needs to display...pull accordingly
       
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TicketCell", for: indexPath)
            _winningTicket.compareForWinnings(secondTicket: _tickets[indexPath.row])
            configureLabelText(cell, withNumbersFrom: _tickets[indexPath.row])
            let cellColor = _tickets[indexPath.row].myColor
            cell.backgroundColor = cellColor
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WinningTicketCell", for: indexPath)
        configureLabelText(cell, withNumbersFrom: _winningTicket, frontText: "The winning ticket: ")
        return cell
    }
    
    func configureLabelText(_ cell: UITableViewCell, withNumbersFrom ticket: Ticket, frontText: String = "") {
        let label = cell.viewWithTag(1001) as! UILabel
        label.text = frontText + ticket.description
        if let moneyWon = ticket.winnings {
            label.text = String(moneyWon)
        }
    }

}
