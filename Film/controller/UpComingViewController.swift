//
//  UpComingViewController.swift
//  Film
//
//  Created by Dương Hoàng on 10/12/18.
//  Copyright © 2018 henry. All rights reserved.
//

import UIKit

class UpComingViewController: UIViewController {
    
    @IBOutlet weak var tbView: UITableView!
    
    var films: [Film] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showUpcoming()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChiTietViewController2" {
            let mh = segue.destination as! ChiTietViewController
            mh.film = sender as! Film
        }
    }
    
    func showUpcoming(){
        //films = Film().getUpcomingFilms()
        films = FilmPlistLocalData.share.getFilmData(byKey: "PhimSapChieu")
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

extension UpComingViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemFilmTableViewCell") as! ItemFilmTableViewCell
        cell.film = self.films[indexPath.row]
        return cell
    }
}

extension UpComingViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ChiTietViewController2", sender: self.films[indexPath.row])
    }
}
