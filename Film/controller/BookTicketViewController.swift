//
//  BookTicketViewController.swift
//  Film
//
//  Created by Dương Hoàng on 10/3/18.
//  Copyright © 2018 henry. All rights reserved.
//

import UIKit

class BookTicketViewController: UIViewController {

    
    @IBOutlet weak var tvBottomMessage: UILabel!
    @IBOutlet weak var bottomNotify: UIView!
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
            let title = "Xác nhận đặt vé"
            let message = creatTicketSumaryMess(bookingList: self.bookingList)
            showAlert(title: title, message: message)
        }
    }
    
    private func isContains(ticket: FilmTicket, inList: [FilmTicket]) -> Bool {
        return inList.contains(where: {$0.ticketId == ticket.ticketId})
    }
    
    private func creatTicketSumaryMess(bookingList : [FilmTicket]) -> String {
        var vipTicketName = ""
        var vipPrice = 0
        var vipTkCount = 0
        var nonVipTicketName = ""
        var nonVipPrice = 0
        var nonVipTkCount = 0
        for item in bookingList {
            switch item.isVip {
            case true:
                let comma = vipTicketName == "" ? "" : ", "
                vipTicketName += "\(comma)\(item.ticketId)"
                vipPrice += item.price
                vipTkCount += 1
            default:
                let comma = nonVipTicketName == "" ? "" : ", "
                nonVipTicketName += "\(comma)\(item.ticketId)"
                nonVipPrice += item.price
                nonVipTkCount += 1
            }
        }
        var message = ""
        if  vipTkCount > 0 {
            message += appendMessageParam(tkCount: vipTkCount, tkName: vipTicketName, tkPrice: vipPrice, isVip: true)
        }
        if  nonVipTkCount > 0 {
            message += appendMessageParam(tkCount: nonVipTkCount, tkName: nonVipTicketName, tkPrice: nonVipPrice, isVip: false)
        }

        let sum = "Tổng tiền \(bookingList.count) vé: \(vipPrice + nonVipPrice)đ"
        message += sum
        return message
    }
    
    private func appendMessageParam(tkCount: Int, tkName: String, tkPrice: Int, isVip: Bool) -> String{
        let vip = isVip ? "VIP" : "thường"
        return "\(tkCount) vé \(vip): \(tkName) giá \(tkPrice)đ\n"
    }
    
    private func showAlert(title: String, message: String){
        let noti = UIAlertController(title: title, message: message, preferredStyle: .alert)
        noti.addAction(alertOkAction())
        noti.addAction(alertCancelAction())
        self.present(noti, animated: true, completion:nil)
    }
    
    // Create OK button
    private func alertOkAction() -> UIAlertAction {
        return UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            // Code in this block will trigger when OK button tapped.
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    // Create Cancel button
    private func alertCancelAction() -> UIAlertAction {
        return UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction!) in
            print("Cancel button tapped");
        }
    }
    
    private func showBottomNotify(message: String) {
        bottomNotify.isHidden = false
        tvBottomMessage.text = message
        let deadlineTime = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: {
            self.bottomNotify.isHidden = true
        })
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

extension BookTicketViewController : TicketTableViewCellDelegate {
    func handleChairClicked(ticket: FilmTicket, rowPos: Int) {
        if isContains(ticket: ticket, inList: alreadyBook) {
            showBottomNotify(message: "Ghế đã được người khác đặt")
        } else {
            let indexPath = IndexPath(row: rowPos, section: 1)
            addOrRemoveBooking(ticket: ticket)
            tbViewBookTicket.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    func addOrRemoveBooking(ticket: FilmTicket) {
        for (index, item) in bookingList.enumerated() {
            if item.ticketId == ticket.ticketId {
                bookingList.remove(at: index)
                return
            }
        }
        bookingList.append(ticket)
    }
}
