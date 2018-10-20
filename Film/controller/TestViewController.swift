//
//  TestViewController.swift
//  Film
//
//  Created by Dương Hoàng on 10/19/18.
//  Copyright © 2018 henry. All rights reserved.
//

import UIKit

class TestViewController: FilmParentViewController {
    @IBOutlet weak var tbView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadFilmData() {
        super.films = FilmPlistLocalData.share.getFilmData(byKey: "PhimDangChieu")
        tbView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
