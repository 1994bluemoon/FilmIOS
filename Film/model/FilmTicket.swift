//
//  FilmTicket.swift
//  Film
//
//  Created by Dương Hoàng on 10/5/18.
//  Copyright © 2018 henry. All rights reserved.
//

import Foundation
import UIKit

class FilmTicket {
    var ticketId: String = ""
    var isVip : Bool = false
    var price : Int = 0
    var defaultColor : UIColor = UIColor()
    
    init(ticketId: String, isVip: Bool) {
        self.ticketId = ticketId
        self.isVip = isVip
        self.price = calCuPrice()
        self.defaultColor = calCuColor()
    }
    
    private func calCuPrice() -> Int {
        return isVip ? 100000 : 80000
    }
    
    private func calCuColor() -> UIColor {
        return isVip ? UIColor.red : UIColor.yellow
    }
}
