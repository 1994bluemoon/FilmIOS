//
//  TicketTableViewCell.swift
//  Film
//
//  Created by Dương Hoàng on 10/5/18.
//  Copyright © 2018 henry. All rights reserved.
//

import UIKit

class TicketTableViewCell: UITableViewCell {
    @IBOutlet weak var tvTitle: UILabel!
    @IBOutlet weak var bt1: UIButton!
    @IBOutlet weak var bt2: UIButton!
    @IBOutlet weak var bt3: UIButton!
    @IBOutlet weak var bt4: UIButton!
    @IBOutlet weak var bt5: UIButton!
    @IBOutlet weak var bt6: UIButton!
    @IBOutlet weak var bt7: UIButton!
    @IBOutlet weak var bt8: UIButton!
    
    weak var delegate: TicketTableViewCellDelegate?
    private var rowPos: Int = 0
    var alreadyBooks: [FilmTicket] = []
    var bookings: [FilmTicket] = []
    var rowTickets: [FilmTicket] = []
    
    @IBAction func btClicked(_ sender: Any) {
        if let sender = sender as? UIButton {
            switch sender {
            case bt1:
                let ticket = rowTickets[0]
                if  !isAlreadyBook(ticket: ticket) {
                    delegate?.handleChairClicked(ticket: ticket, rowPos: rowPos)
                }
            case bt2:
                let ticket = rowTickets[1]
                if  !isAlreadyBook(ticket: ticket) {
                    delegate?.handleChairClicked(ticket: ticket, rowPos: rowPos)
                }
            case bt3:
                let ticket = rowTickets[2]
                if  !isAlreadyBook(ticket: ticket) {
                    delegate?.handleChairClicked(ticket: ticket, rowPos: rowPos)
                }
            case bt4:
                let ticket = rowTickets[3]
                if  !isAlreadyBook(ticket: ticket) {
                    delegate?.handleChairClicked(ticket: ticket, rowPos: rowPos)
                }
            case bt5:
                let ticket = rowTickets[4]
                if  !isAlreadyBook(ticket: ticket) {
                    delegate?.handleChairClicked(ticket: ticket, rowPos: rowPos)
                }
            case bt6:
                let ticket = rowTickets[5]
                if  !isAlreadyBook(ticket: ticket) {
                    delegate?.handleChairClicked(ticket: ticket, rowPos: rowPos)
                }
            case bt7:
                let ticket = rowTickets[6]
                if  !isAlreadyBook(ticket: ticket) {
                    delegate?.handleChairClicked(ticket: ticket, rowPos: rowPos)
                }
            case bt8:
                let ticket = rowTickets[7]
                if  !isAlreadyBook(ticket: ticket) {
                    delegate?.handleChairClicked(ticket: ticket, rowPos: rowPos)
                }
            default:
                return
            }
        }
    }
    
    func setCellData(rowPos: Int, rowTicket: [FilmTicket], bookingTicket: [FilmTicket], alreadyBook: [FilmTicket]){
        self.rowPos = rowPos
        self.rowTickets = rowTicket
        self.bookings = bookingTicket
        self.alreadyBooks = alreadyBook
        setCaption()
        setChairColor()
    }
    
    private func setCaption(){
        let caption = String(rowTickets[0].ticketId.prefix(1))
        tvTitle.text = caption
    }
    
    private func isAlreadyBook(ticket: FilmTicket) -> Bool {
        return alreadyBooks.contains(where: {$0.ticketId == ticket.ticketId})
    }
    
    private func isBooking(ticket: FilmTicket) -> Bool {
        return bookings.contains(where: {$0.ticketId == ticket.ticketId})
    }
    
    private func setChairColor() {
        let ticket1 = rowTickets[0]
        if isAlreadyBook(ticket: ticket1) {
            bt1.backgroundColor = UIColor.purple
        } else if isBooking(ticket: ticket1){
            bt1.backgroundColor = UIColor.green
        } else {
            bt1.backgroundColor = ticket1.defaultColor
        }
    
        let ticket2 = rowTickets[1]
        if isAlreadyBook(ticket: ticket2) {
            bt2.backgroundColor = UIColor.purple
        } else if isBooking(ticket: ticket2){
            bt2.backgroundColor = UIColor.green
        } else {
            bt2.backgroundColor = ticket2.defaultColor
        }
        
        let ticket3 = rowTickets[2]
        if isAlreadyBook(ticket: ticket3) {
            bt3.backgroundColor = UIColor.purple
        } else if isBooking(ticket: ticket3){
            bt3.backgroundColor = UIColor.green
        } else {
            bt3.backgroundColor = ticket3.defaultColor
        }
        
        let ticket4 = rowTickets[3]
        if isAlreadyBook(ticket: ticket4) {
            bt4.backgroundColor = UIColor.purple
        } else if isBooking(ticket: ticket4){
            bt4.backgroundColor = UIColor.green
        } else {
            bt4.backgroundColor = ticket4.defaultColor
        }
        
        let ticket5 = rowTickets[4]
        if isAlreadyBook(ticket: ticket5) {
            bt5.backgroundColor = UIColor.purple
        } else if isBooking(ticket: ticket5){
            bt5.backgroundColor = UIColor.green
        } else {
            bt5.backgroundColor = ticket5.defaultColor
        }
        
        let ticket6 = rowTickets[5]
        if isAlreadyBook(ticket: ticket6) {
            bt6.backgroundColor = UIColor.purple
        } else if isBooking(ticket: ticket6){
            bt6.backgroundColor = UIColor.green
        } else {
            bt6.backgroundColor = ticket6.defaultColor
        }
        
        let ticket7 = rowTickets[6]
        if isAlreadyBook(ticket: ticket7) {
            bt7.backgroundColor = UIColor.purple
        } else if isBooking(ticket: ticket7){
            bt7.backgroundColor = UIColor.green
        } else {
            bt7.backgroundColor = ticket7.defaultColor
        }
        
        let ticket8 = rowTickets[7]
        if isAlreadyBook(ticket: ticket8) {
            bt8.backgroundColor = UIColor.purple
        } else if isBooking(ticket: ticket8){
            bt8.backgroundColor = UIColor.green
        } else {
            bt8.backgroundColor = ticket8.defaultColor
        }
    }
}
