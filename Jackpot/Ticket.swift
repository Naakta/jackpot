//
//  Ticket.swift
//  Jackpot
//
//  Created by Doug Wagner on 3/20/18.
//  Copyright © 2018 Doug Wagner. All rights reserved.
//

import Foundation
import UIKit

class Ticket {
    
    var numbers = Set<Int>()
    var myColor = UIColor.clear
    var winnings: Int?
    var isWinner = false
    var description = ""
    
    // MARK:-
    
    // Init method for quick pick tickets. Randomly generates 6 unique numbers
    init() {
        let maxRange: UInt32 = 53
        numbers.insert(Int(arc4random_uniform(maxRange)+1))
        repeat {
            let newPick = Int(arc4random_uniform(maxRange)+1)
            if numbers.contains(newPick) {
                continue
            } else {
                numbers.insert(newPick)
            }
        } while numbers.count < 6
        
        let numArray = numbers.sorted()
        for number in numArray {
            description += "\(number) "
        }
    }
    
    // Init method for the WinningTicketVC - collects values from text fields and attempts to create a ticket
    // Couldn't return nil within the for loop (it wouldn't pop out of the init, would only act as a continue)
    // init will return nil if the numbers in the text fields are not unique (there are dupes)
    init?(ticketNumbers: Set<Int>) {
        for pick in ticketNumbers {
            if !numbers.contains(pick) {
                numbers.insert(pick)
            }
        }
        
        if numbers.count < 6 {
            return nil
        }
        
        let numArray = numbers.sorted()
        for number in numArray {
            description += "\(number) "
        }
    }
    
    // Method is called and sets different properties within the ticket for VC to use
    func compareForWinnings(ticket: Ticket) {
        var count = 0
        for num in ticket.numbers {
            if numbers.contains(num) {
                count += 1
            }
        }
        
        // Sets background color to green if ticket is a winner
        if count > 2 {
            ticket.myColor = UIColor(red: 192/255, green: 255/255, blue: 158/255, alpha: 1)
            ticket.isWinner = true
        }

        // Sets just how much each ticket is worth
        if count == 3 {
            ticket.winnings = 1
        } else if count == 4 {
            ticket.winnings = 5
        } else if count == 5 {
            ticket.winnings = 20
        } else if count == 6 {
            ticket.winnings = 100
        }
    }
}



