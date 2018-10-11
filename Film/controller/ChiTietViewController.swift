//
//  ChiTietViewController.swift
//  Film
//
//  Created by Dương Hoàng on 9/24/18.
//  Copyright © 2018 henry. All rights reserved.
//

import UIKit

class ChiTietViewController: UIViewController, DMyDelegate {

    @IBOutlet weak var tbContent: UITableView!
    
    var film: Film = Film()
    var relateFilms: [Film] = []
    
    override func viewDidLoad() {
        reload()
        
        tbContent.estimatedRowHeight = 100
        tbContent.rowHeight = UITableView.automaticDimension
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "BookTicketViewController" {
            let mh = segue.destination as! BookTicketViewController
            mh.film = sender as! Film
        }
    }
    
    func bookTicketClicked() {
        performSegue(withIdentifier: "BookTicketViewController", sender: self.film)
    }
    
    func reload(){
        relateFilms = getRelateFilm()
        tbContent.reloadData()
        tbContent.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
    }
    
    func getRelateFilm() -> [Film]{
        var films: [Film] = []
        let list = Film().getUpcomingFilms()
        let limit = Int.random(in:0...5)
        while films.count < limit {
            let f = list[Int.random(in: 0..<list.count)]
            if check(listFilms: films, film: f){
                films.append(f)
            }
        }
        return films
    }
    
    func check(listFilms: [Film], film: Film) -> Bool{
        for temp in listFilms {
            if temp.Title == film.Title {
                return false
            }
        }
        return true
    }
}

extension ChiTietViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        default:
            return relateFilms.count == 0 ? 0 : relateFilms.count + 1
     
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell") as! BannerTableViewCell
                if(self.film.BackDropPath == ""){
                    cell.imBanner.image = UIImage(named: "banner")
                } else{
                    cell.imBanner.setImage(from: URL(string: "https://image.tmdb.org/t/p/w500\(self.film.BackDropPath ?? "")")!, withPlaceholder: cell.imBanner.image)
                }
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTableViewCell") as! TitleTableViewCell
                cell.lbTitle.text = self.film.Title
                cell.imPoster.setImage(from: URL(string: "https://image.tmdb.org/t/p/w500\(self.film.LogoPath ?? "")")!, withPlaceholder: cell.imPoster.image)
                cell.myDelegate = self
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell") as! DescriptionTableViewCell
                cell.tvDescription.text = self.film.Description
                return cell
            }
        } else {
            if indexPath.row == 0 {
                return tableView.dequeueReusableCell(withIdentifier: "RelateCell")!
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemFilmTableViewCell") as! ItemFilmTableViewCell
                cell.film = self.relateFilms[indexPath.row - 1]
                return cell
            }
        }
    }
}

extension ChiTietViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if indexPath.row > 0 {
                self.film = self.relateFilms[indexPath.row - 1]
                self.reload()
            }
        }
    }
}
