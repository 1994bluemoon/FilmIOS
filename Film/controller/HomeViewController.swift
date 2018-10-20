//
//  HomeViewController.swift
//  Film
//
//  Created by Dương Hoàng on 9/21/18.
//  Copyright © 2018 henry. All rights reserved.
//

import UIKit

class HomeViewController: FilmParentViewController {
    
    @IBOutlet weak var tbView: UITableView!
    
    override func loadFilmData() {
        super.films = FilmPlistLocalData.share.getFilmData(byKey: "PhimDangChieu")
        tbView.reloadData()
    }
    
    override func performCellFilmClicked(film: Film) {
        super.indentify = "ChiTietViewController"
        super.performCellFilmClicked(film: film)
    }
    
//   func moveToDetail(film: Film){
//       let stb = UIStoryboard(name: "Main", bundle: nil)
//       let detailViewController = stb.instantiateViewController(withIdentifier: "ChiTietViewController") as! ChiTietViewController
//       detailViewController.film = film
//       self.navigationController?.pushViewController(detailViewController, animated: true)
//       print(film.title)
//   }
    
    //54715436e1813692f121feb9fd97709e

}

// xây dựng 1 class thí sinh có những pro sau: mã, tên , nsinh, điểm toán, văn, anh
// nhập vào  n thí sinh in ra thí sinh có kết quả tổng điểm lớn hơn 15 trong đó biết cách tính điểm (toán hs 2), xuất ra điểm thí sinh có tổng điểm lớn hơn 15 và môn toán dưới 5

