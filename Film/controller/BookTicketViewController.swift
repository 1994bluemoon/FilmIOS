//
//  BookTicketViewController.swift
//  Film
//
//  Created by Dương Hoàng on 10/3/18.
//  Copyright © 2018 henry. All rights reserved.
//

import UIKit

class BookTicketViewController: UIViewController, TicketTableViewCellDelegate{

    
    @IBOutlet weak var tbViewBookTicket: UITableView!
    
    let CHAIRPERROW = 8
    
    var totalTicket: [FilmTicket] = []
    var alreadyBook: [FilmTicket] = []
    var bookingList: [FilmTicket] = []
    var film = Film()

    override func viewDidLoad() {
        super.viewDidLoad()

        createTicket()
        createAlreadyBookList(total: 10)
        
        tbViewBookTicket.estimatedRowHeight = 100
        tbViewBookTicket.rowHeight = UITableView.automaticDimension
        tbViewBookTicket.reloadData()
    }
    
    @IBAction func btDone(_ sender: Any) {
        if bookingList.count > 0 {
            let totalTk = bookingList.count
            var name = ""
            var price = 0
            for (index, item) in bookingList.enumerated() {
                if index == bookingList.count - 1 {
                    name += item.ticketId
                } else {
                    name += "\(item.ticketId), "
                }
                price += item.price
            }
            let noti = UIAlertController(title: "Xác nhận đặt vé", message: "Xác nhận đặt \(totalTk) vé: \(name)\nTổng tiền: \(price)đ", preferredStyle: .alert)
            
            // Create OK button
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                // Code in this block will trigger when OK button tapped.
                print("Ok button tapped");
            }
            noti.addAction(OKAction)
            
            // Create Cancel button
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction!) in
                print("Cancel button tapped");
            }
            noti.addAction(cancelAction)
            self.present(noti, animated: true, completion:nil)
        }
        
    }
    
    func handleChairClicked(ticket: FilmTicket, rowPos: Int) {
        let indexPath = IndexPath(row: rowPos, section: 1)
        for (index, item) in bookingList.enumerated() {
            if item.ticketId == ticket.ticketId {
                bookingList.remove(at: index)
                tbViewBookTicket.reloadRows(at: [indexPath], with: .automatic)
                return
            }
        }
        bookingList.append(ticket)
        tbViewBookTicket.reloadRows(at: [indexPath], with: .automatic)
    }
    
    private func createTicket() {
        let head = ["A", "B", "C", "D", "E", "F", "G", "H"]
        for (index, item) in head.enumerated() {
            var isVip = false
            if  index > 2 && index < 6 {
                isVip = true
            }
            for i in 0..<CHAIRPERROW {
                totalTicket.append(FilmTicket(ticketId: "\(item)\(i + 1)", isVip:   isVip))
            }
        }
    }
    
    private func createAlreadyBookList(total: Int) {
        while alreadyBook.count < total {
            let index = Int.random(in: 0..<totalTicket.count)
            let tk = totalTicket[index]
            if !isContains(ticket: tk, inList: alreadyBook) {
                alreadyBook.append(tk)
            }
        }
    }
    
    private func createTicketForRow(position: Int) -> [FilmTicket]{
        let startPosition = CHAIRPERROW * position
        let endPosition = startPosition + CHAIRPERROW - 1
        var ticketForRow: [FilmTicket] = []
        for index in startPosition...endPosition {
            ticketForRow.append(totalTicket[index])
        }
        return ticketForRow
    }
    
    private func isContains(ticket: FilmTicket, inList: [FilmTicket]) -> Bool {
        return inList.contains(where: {$0.ticketId == ticket.ticketId})
    }

}

extension BookTicketViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return totalTicket.count / CHAIRPERROW + 1
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ScreenTableViewCell") else {return UITableViewCell()}
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell") else {return UITableViewCell()}
            return cell
        default:
            if indexPath.row == 8 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "BottomNumberTableViewCell") else {return UITableViewCell()}
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "TicketTableViewCell") as? TicketTableViewCell else {return UITableViewCell()}
                cell.delegate = self
                let ticketForRow = self.createTicketForRow(position: indexPath.row)
                cell.setCellData(rowPos:  indexPath.row, rowTicket: ticketForRow,bookingTicket: bookingList, alreadyBook: alreadyBook)
                return cell
            }
        }
    }
}
