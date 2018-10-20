//
//  UpComingViewController.swift
//  Film
//
//  Created by Dương Hoàng on 10/12/18.
//  Copyright © 2018 henry. All rights reserved.
//

import UIKit

class UpComingViewController: FilmParentViewController {
    
    @IBOutlet weak var tbView: UITableView!
    
    override func loadFilmData() {
        super.films = FilmPlistLocalData.share.getFilmData(byKey: "PhimSapChieu")
        tbView.reloadData()
    }
    
    override func performCellFilmClicked(film: Film) {
        super.indentify = "ChiTietViewController2"
        super.performCellFilmClicked(film: film)
    }
}
