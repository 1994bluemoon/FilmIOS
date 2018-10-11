//
//  FilmTicketDelegate.swift
//  Film
//
//  Created by Dương Hoàng on 10/5/18.
//  Copyright © 2018 henry. All rights reserved.
//

import Foundation

protocol TicketTableViewCellDelegate : class {
    func handleChairClicked(ticket: FilmTicket, rowPos: Int)
}
