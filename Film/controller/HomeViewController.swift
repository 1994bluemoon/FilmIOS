//
//  HomeViewController.swift
//  Film
//
//  Created by Dương Hoàng on 9/21/18.
//  Copyright © 2018 henry. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tbView: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var films: [Film] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNowPlaying()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChiTietViewController" {
            let mh = segue.destination as! ChiTietViewController
            mh.film = sender as! Film
        }
    }

    @IBAction func segmentControlSelectChange(_ sender: Any) {
        if (segmentControl?.selectedSegmentIndex == 0){
            showNowPlaying()
        } else{
            showUpcoming()
        }
    }
    
    func showNowPlaying(){
        films = Film().getNowPlayingFilms()
        tbView.reloadData()
    }
    
    func showUpcoming(){
        films = Film().getUpcomingFilms()
        tbView.reloadData()
    }
    
    func moveToDetail(film: Film){
        let stb = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = stb.instantiateViewController(withIdentifier: "ChiTietViewController") as! ChiTietViewController
        detailViewController.film = film
        self.navigationController?.pushViewController(detailViewController, animated: true)
        print(film.Title ?? "nil")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //54715436e1813692f121feb9fd97709e

}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemFilmTableViewCell") as! ItemFilmTableViewCell
        cell.film = films[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ChiTietViewController", sender: self.films[indexPath.row])
//        self.moveToDetail(film: self.films[indexPath.row])
    }
}

