//
//  Ticket.swift
//  TIY_Jackpot
//
//  Created by Doug Wagner on 3/20/18.
//  Copyright © 2018 Doug Wagner. All rights reserved.
//

import Foundation
import UIKit

class Ticket {
    var numbers = Set<Int>()
    var myColor = UIColor.clear
    var matchingNumbers = 0
    var winnings: Int?
    var isWinner = false
    var description = ""
    
    init() {
        let maxRange: UInt32 = 15
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
    
    func compareForWinnings(secondTicket: Ticket) {
        var count = 0
        for num in secondTicket.numbers {
            if numbers.contains(num) {
                count += 1
            }
        }
        print(count)
        secondTicket.matchingNumbers = count
        if count > 2 {
            secondTicket.myColor = UIColor(red: 192.0, green: 255.0, blue: 158.0, alpha: 1)
//            secondTicket.myColor = UIColor.green
            secondTicket.isWinner = true
        }

        if count == 3 {
            secondTicket.winnings = 1
        } else if count == 4 {
            secondTicket.winnings = 5
        } else if count == 5 {
            secondTicket.winnings = 20
        } else if count == 6 {
            secondTicket.winnings = 100
        }
    }
}

    
    
    // First solution - using an array instead of a set
    // Keeping for possible future use
    
//    var _numbers = [Int]()
//    init() {
//        let maxRange: UInt32 = 12
//        _numbers.append(Int(arc4random_uniform(maxRange)+1))
//        for i in 1...5 {
//            _numbers.append(Int(arc4random_uniform(maxRange)+1))
//            while checkDuplicateNumbers() == false {
//                _numbers[i] = Int(arc4random_uniform(maxRange)+1)
//            }
//        }
//    }
//
//    func checkDuplicateNumbers() -> Bool {
//        for i in 0..._numbers.count-1 {
//            if i == _numbers.count-1 {
//                return true
//            }
//            for j in i+1..._numbers.count-1 {
//                if _numbers[i] == _numbers[j] {
//                    return false
//                }
//            }
//        }
//        return true
//    }
    
//    func compareTicketsForWinnings(secondTicket: Ticket) -> Int {
//        var count = 0
//        
//        let sortedTIcket = secondTicket._numbers.sorted()
//        print(sortedTIcket)
//        for i in 0...5 {
//            for j in 0...5 {
//                if self._numbers[i] == secondTicket._numbers[j] {
//                    count += 1
//                }
//            }
//        }
//        return count
//    }

