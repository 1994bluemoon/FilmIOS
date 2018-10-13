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
            let ticket = rowTickets[sender.tag]
            delegate?.handleChairClicked(ticket: ticket, rowPos: rowPos)
        }
    }
    
    func setCellData(rowPos: Int, rowTicket: [FilmTicket], bookingTicket: [FilmTicket], alreadyBook: [FilmTicket]){
        self.rowPos = rowPos
        self.rowTickets = rowTicket
        self.bookings = bookingTicket
        self.alreadyBooks = alreadyBook
        setCaption()
        bindTicketToButton()
    }
    
    private func isContains(ticket: FilmTicket, inList: [FilmTicket]) -> Bool {
        return inList.contains(where: {$0.ticketId == ticket.ticketId})
    }
    
    private func setCaption(){
        let caption = String(rowTickets[0].ticketId.prefix(1))
        tvTitle.text = caption
    }
    
    private func bindTicketToButton() {
        for (index, item) in rowTickets.enumerated() {
            let bt = getButtonByTag(tag: index)
            setChairColor(ticket: item, button: bt)
        }
    }
    
    private func setChairColor(ticket: FilmTicket, button: UIButton) {
        if isContains(ticket: ticket, inList: alreadyBooks) {
            button.backgroundColor = UIColor.purple
        } else if isContains(ticket: ticket, inList: bookings) {
            button.backgroundColor = UIColor.green
        } else {
            button.backgroundColor = ticket.defaultColor
        }
    }
    
    private func getButtonByTag(tag: Int) -> UIButton{
        switch tag {
        case 0:
            return bt1
        case 1:
            return bt2
        case 2:
            return bt3
        case 3:
            return bt4
        case 4:
            return bt5
        case 5:
            return bt6
        case 6:
            return bt7
        case 7:
            return bt8
        default:
            return UIButton()
        }
    }
}
