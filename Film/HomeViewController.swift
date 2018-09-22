//
//  HomeViewController.swift
//  Film
//
//  Created by Dương Hoàng on 9/21/18.
//  Copyright © 2018 henry. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tbView: UITableView!
    var films: [Film] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let film = Film()
        films = film.getNowPlayingFilms()
        tbView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemFilmTableViewCell", for: indexPath) as! ItemFilmTableViewCell
        cell.film = films[indexPath.row]
        return cell
    }
    
    @IBAction func `switch`(_ sender: Any) {
        
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

